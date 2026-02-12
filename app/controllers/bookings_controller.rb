class BookingsController < ApplicationController
  allow_unauthenticated_access

  def intro
  end

  def topics
    @topics = ConsultationTopic.all
  end

  def times
    @topic = ConsultationTopic.find(params[:id])
    @time_slots = @topic.time_slots.available
  end

  def checkout
    @topic = ConsultationTopic.find(params[:consultation_topic_id])
    @time_slot = TimeSlot.find(params[:time_slot_id])

    booking = Booking.create!(
      name: params[:name],
      email: params[:email],
      consultation_topic: @topic,
      time_slot: @time_slot,
      status: "pending"
    )

    @time_slot.update!(booked: true)

    if ENV["POLAR_ACCESS_TOKEN"].present?
      client = PolarSh::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])
      checkout_session = client.checkouts.create(
        product_id: ENV["POLAR_PRODUCT_ID"],
        customer_email: params[:email],
        metadata: {
          booking_id: booking.id,
          topic_id: @topic.id,
          time_slot_id: @time_slot.id
        }
      )
      booking.update!(polar_checkout_id: checkout_session.id)
      redirect_to checkout_session.url, allow_other_host: true
    else
      # Development fallback: skip payment, mark as confirmed
      booking.update!(status: "confirmed")
      redirect_to book_success_path(booking_id: booking.id)
    end
  end

  def success
    @booking = Booking.find(params[:booking_id]) if params[:booking_id]
  end
end
