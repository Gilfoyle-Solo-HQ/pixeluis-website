class PodcastsController < ApplicationController
  allow_unauthenticated_access

  def index
    @episodes = PodcastEpisode.recent
  end
end
