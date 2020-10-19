require 'rails_helper'

describe SearchFacade do
  it "returns ten food results from query" do
    response = File.read("spec/fixtures/sweet_potatoes_foods.json")
    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV["FDC_API_KEY"]}&pageNumber=1&pageSize=10&query=sweet%20potatoes").
      to_return(status: 200, body: response, headers: {})

    query = "sweet potatoes"
    results = SearchFacade.foods_search(query)

    expect(results).to be_an(Array)
    expect(results.size).to eq(10)
    expect(results.first).to be_a(Food)
    expect(results.first.code).to be_a(String)
    expect(results.first.description).to be_a(String)
    expect(results.first.brand_owner).to be_a(String)
    expect(results.first.ingredients).to be_a(String)
  end
end
