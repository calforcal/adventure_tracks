class MapCoordinate < ApplicationRecord
  belongs_to :map
  belongs_to :coordinate
end