class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :language
      t.integer :artifact_id

      t.timestamps
    end
  end
end
