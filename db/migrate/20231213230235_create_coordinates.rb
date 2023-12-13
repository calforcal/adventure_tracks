class CreateCoordinates < ActiveRecord::Migration[7.0]
  def change
    create_table :coordinates do |t|
      t.float :x_axis
      t.float :y_axis
      t.float :z_axis
      t.datetime :time

      t.timestamps
    end
  end
end
