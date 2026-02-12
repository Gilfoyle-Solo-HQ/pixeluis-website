class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :body

  scope :published, -> { where(published: true).order(published_at: :desc) }
  scope :draft, -> { where(published: false) }

  validates :title, presence: true
end
