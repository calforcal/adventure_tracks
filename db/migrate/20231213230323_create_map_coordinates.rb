class CreateMapCoordinates < ActiveRecord::Migration[7.0]
  def change
    create_table :map_coordinates do |t|
      t.references :map, null: false, foreign_key: true
      t.references :coordinate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
