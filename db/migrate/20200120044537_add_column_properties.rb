class AddColumnProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :rent, :integer
  end
end
