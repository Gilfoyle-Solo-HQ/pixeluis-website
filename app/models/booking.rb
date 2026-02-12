class Booking < ApplicationRecord
  belongs_to :consultation_topic
  belongs_to :time_slot

  validates :name, presence: true
  validates :email, presence: true

  scope :confirmed, -> { where(status: "confirmed") }
  scope :pending, -> { where(status: "pending") }
  scope :recent, -> { order(created_at: :desc) }
end
