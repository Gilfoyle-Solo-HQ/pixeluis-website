class CreateTimeSlots < ActiveRecord::Migration[8.1]
  def change
    create_table :time_slots do |t|
      t.references :consultation_topic, null: false, foreign_key: true
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :booked, default: false

      t.timestamps
    end
  end
end
