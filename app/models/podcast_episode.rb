class PodcastEpisode < ApplicationRecord
  scope :recent, -> { order(published_at: :desc) }

  validates :title, presence: true
  validates :embed_url, presence: true
end
