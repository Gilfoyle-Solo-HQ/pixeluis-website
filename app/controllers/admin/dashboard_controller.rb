class Admin::DashboardController < Admin::BaseController
  def index
    @recent_bookings = Booking.recent.limit(5)
    @post_count = Post.count
    @published_post_count = Post.published.count
    @booking_count = Booking.confirmed.count
    @episode_count = PodcastEpisode.count
  end
end
