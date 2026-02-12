class CreateConsultationTopics < ActiveRecord::Migration[8.1]
  def change
    create_table :consultation_topics do |t|
      t.string :name
      t.text :description
      t.integer :price_cents
      t.integer :duration_minutes

      t.timestamps
    end
  end
end
