class ConsultationTopic < ApplicationRecord
  has_many :time_slots, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :price_cents, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :duration_minutes, presence: true, numericality: { greater_than: 0 }

  def price_dollars
    price_cents / 100.0
  end

  def formatted_price
    "$#{'%.2f' % price_dollars}"
  end
end
