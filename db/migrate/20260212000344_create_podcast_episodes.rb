class CreatePodcastEpisodes < ActiveRecord::Migration[8.1]
  def change
    create_table :podcast_episodes do |t|
      t.string :title
      t.text :description
      t.string :embed_url
      t.string :platform
      t.datetime :published_at

      t.timestamps
    end
  end
end
