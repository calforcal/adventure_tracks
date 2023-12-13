require "rails_helper"

RSpec.describe Coordinate, type: :model do
  describe "#relationships" do
    it { should have_one(:map_coordinate) }
    it { should have_one(:map).through(:map_coordinate) }
  end
end