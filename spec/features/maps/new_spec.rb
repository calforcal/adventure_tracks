require "rails_helper"

RSpec.describe "create", type: :feature do
  before(:each) do
    visit maps_new_path
  end

  describe "create page" do
    it "exists" do
      expect(current_path).to eq(maps_new_path)
      expect(page).to have_content("Adventure Tracks")
      expect(page).to have_content("Click to Upload File")
    end
  end
end