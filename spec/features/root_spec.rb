require "rails_helper"

RSpec.describe "root", type: :feature do
  before(:each) do
    visit root_path
  end

  describe "home page" do
    describe "happys paths" do
      it "can visit the home page" do
        expect(page).to have_content("Adventure Tracks")
      end

      it "has a button to upload a file" do
        expect(page).to have_content("Upload .gpx File")
        click_button "Upload .gpx File"
      end

      it "takes you to a new page when the button is clicked" do
        click_button "Upload .gpx File"
        expect(current_path).to eq(maps_path)
      end
    end
  end
end