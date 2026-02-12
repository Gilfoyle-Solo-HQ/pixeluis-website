class Admin::BookingsController < Admin::BaseController
  def index
    @bookings = Booking.recent.includes(:consultation_topic, :time_slot)
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
