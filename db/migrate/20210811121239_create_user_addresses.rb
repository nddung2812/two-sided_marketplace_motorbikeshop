class CreateUserAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :user_addresses do |t|
      t.integer :street_number
      t.string :street_name
      t.string :postcode_id
      t.string :integer
      t.references :user_contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
