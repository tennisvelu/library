class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :status
      t.integer :checked_out_by
      t.belongs_to :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end
