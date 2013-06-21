class CreateArtifacts < ActiveRecord::Migration
  def change
    create_table :artifacts do |t|
      t.string :name
      t.string :dating
      t.text :description
      t.string :code
      t.string :place
      t.string :size
      t.string :language
      t.integer :material_id
      t.integer :gallery_id

      t.timestamps
    end
  end
end
