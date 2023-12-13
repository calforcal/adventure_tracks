class Coordinate < ApplicationRecord
  has_one :map_coordinate
  has_one :map, through: :map_coordinate
end