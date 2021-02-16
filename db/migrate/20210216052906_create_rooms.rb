class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :area
      t.text :introduce
      t.date :start
      t.date :end
      t.integer :price
      t.integer :num
      t.integer :user_id
      t.boolean :reserved

      t.timestamps
    end
  end
end
