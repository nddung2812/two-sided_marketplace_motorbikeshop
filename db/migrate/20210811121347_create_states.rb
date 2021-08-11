class CreateStates < ActiveRecord::Migration[6.1]
  def change
    create_table :states do |t|
      t.string :state_name
      t.references :user_address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
