class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :address
      t.string :gender
      t.integer :user_id

      t.timestamps
    end
  end
end
