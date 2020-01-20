class Renameindexkey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :properties, :stations
    remove_index :stations, :propety_id
    remove_reference :stations, :propety
  end
end
