class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :address
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
