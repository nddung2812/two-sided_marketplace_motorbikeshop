class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :job
      t.text :description
      t.float :price
      t.string :model
      t.string :make
      t.boolean :major_service
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
