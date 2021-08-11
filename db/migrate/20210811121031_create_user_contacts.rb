class CreateUserContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_contacts do |t|
      t.string :email
      t.integer :phone
      t.integer :address_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
