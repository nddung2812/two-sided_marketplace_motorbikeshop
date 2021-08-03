class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.float :price
      t.boolean :used_vehicle
      t.string :make
      t.string :model
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
