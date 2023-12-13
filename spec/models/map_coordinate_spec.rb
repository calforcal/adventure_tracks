require "rails_helper"

RSpec.describe MapCoordinate, type: :model do
  describe "#relationships" do
    it { should belong_to(:map) }
    it { should belong_to(:coordinate) }
  end
end