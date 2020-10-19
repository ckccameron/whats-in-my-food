# 10 most relevant foods that contain ingredient searched for
# As a user,
# When I visit "/"
# And I fill in the search form with "sweet potatoes"
# (Note: Use the existing search form)
# And I click "Search"
# Then I should be on page "/foods"
# Then I should see a total of the number of items returned by the search.
# Then I should see a list of ten foods that contain the ingredient "sweet potatoes"
# And for each of the foods I should see:
# - The food's GTIN/UPC code
# - The food's description
# - The food's Brand Owner
# - The food's ingredients

require 'rails_helper'

describe "foods index page" do
  describe "when a user enters query into search bar to find foods" do
    before :each do
      response = File.read("spec/fixtures/sweet_potatoes_foods.json")
      stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV["FDC_API_KEY"]}&pageNumber=1&pageSize=10&query=sweet%20potatoes").
        to_return(status: 200, body: response, headers: {})

      visit root_path

      fill_in :q, with: "sweet potatoes"
      click_button "Search"
    end

    it "shows top 10 most relevant foods that contain the ingredient searched for" do
      expect(current_path).to eq(foods_path)
      expect(page).to have_css(".food", count: 10)
    end

    it "shows code, description, brand owner and ingredients for each food result" do
      expect(current_path).to eq(foods_path)

      within first(".food") do
        expect(page).to have_css(".code")
        code = find(".code").text
        expect(code).to_not be_empty

        expect(page).to have_css(".description")
        description = find(".description").text
        expect(description).to_not be_empty

        expect(page).to have_css(".brand-owner")
        brand_owner = find(".brand-owner").text
        expect(brand_owner).to_not be_empty

        expect(page).to have_css(".ingredients")
        ingredients = find(".ingredients").text
        expect(ingredients).to_not be_empty
      end
    end
  end
end
