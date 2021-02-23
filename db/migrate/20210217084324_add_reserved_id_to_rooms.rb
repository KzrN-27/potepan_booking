class AddReservedIdToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :reserved_id, :integer
  end
end
