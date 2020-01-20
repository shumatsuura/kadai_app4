class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.text :line
      t.text :name
      t.integer :minute
      t.references :propety, foreign_key: true

      t.timestamps
    end
  end
end
