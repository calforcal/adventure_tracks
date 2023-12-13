# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_13_230323) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coordinates", force: :cascade do |t|
    t.float "x_axis"
    t.float "y_axis"
    t.float "z_axis"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "map_coordinates", force: :cascade do |t|
    t.bigint "map_id", null: false
    t.bigint "coordinate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coordinate_id"], name: "index_map_coordinates_on_coordinate_id"
    t.index ["map_id"], name: "index_map_coordinates_on_map_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.string "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "map_coordinates", "coordinates"
  add_foreign_key "map_coordinates", "maps"
end
