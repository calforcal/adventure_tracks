require "rails_helper"

RSpec.describe Map, type: :model do
  describe "#relationships" do
    it { should have_many(:map_coordinates) }
    it { should have_many(:coordinates).through(:map_coordinates) }
  end
end