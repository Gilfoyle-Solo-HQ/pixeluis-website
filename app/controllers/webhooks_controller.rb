class WebhooksController < ApplicationController
  allow_unauthenticated_access
  skip_forgery_protection

  def polar
    payload = request.body.read

    if ENV["POLAR_WEBHOOK_SECRET"].present?
      signature = request.headers["webhook-signature"]
      begin
        PolarSh::Webhooks.verify(payload, signature, secret: ENV["POLAR_WEBHOOK_SECRET"])
      rescue => e
        Rails.logger.error "Polar webhook verification failed: #{e.message}"
        head :bad_request and return
      end
    end

    event = JSON.parse(payload)

    case event["type"]
    when "order.paid"
      handle_order_paid(event["data"])
    end

    head :ok
  end

  private

  def handle_order_paid(data)
    metadata = data.dig("metadata") || {}
    booking_id = metadata["booking_id"]

    return unless booking_id

    booking = Booking.find_by(id: booking_id)
    return unless booking

    booking.update!(
      status: "confirmed",
      polar_order_id: data["id"]
    )
  end
end
