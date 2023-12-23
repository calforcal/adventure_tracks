class Map < ApplicationRecord
  has_many :map_coordinates
  has_many :coordinates, through: :map_coordinates
  has_one_attached :avatar
end