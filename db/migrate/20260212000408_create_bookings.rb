class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :email
      t.references :consultation_topic, null: false, foreign_key: true
      t.references :time_slot, null: false, foreign_key: true
      t.string :polar_checkout_id
      t.string :polar_order_id
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
