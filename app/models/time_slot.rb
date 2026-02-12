class TimeSlot < ApplicationRecord
  belongs_to :consultation_topic
  has_one :booking, dependent: :nullify

  scope :available, -> { where(booked: false).where("starts_at > ?", Time.current).order(:starts_at) }
  scope :upcoming, -> { where("starts_at > ?", Time.current).order(:starts_at) }

  validates :starts_at, presence: true
  validates :ends_at, presence: true

  def formatted_time
    starts_at.strftime("%A, %B %d at %l:%M %p")
  end
end
