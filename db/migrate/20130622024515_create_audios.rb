class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :title
      t.integer :artifact_id

      t.timestamps
    end
  end
end
