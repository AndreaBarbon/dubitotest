class RemoveRoomFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :room
  end
end
