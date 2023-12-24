require "rails_helper"

RSpec.describe "create", type: :feature do
  before(:each) do
    visit new_map_path
  end

  describe "create page" do
    it "exists" do
      expect(current_path).to eq(new_map_path)
      expect(page).to have_content("Adventure Tracks")
    end

    it "can create a new Map object" do
      find('form input[type="file"]').set("/Users/michaelcallahan/Downloads/test.gpx")
      click_on "Save"
      map = Map.last
      expect(current_path).to eq(map_path(map))
    end
  end
end