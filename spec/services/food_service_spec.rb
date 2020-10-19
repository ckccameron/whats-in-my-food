require 'rails_helper'

describe FoodService do
  before :each do
    @service = FoodService.new
  end

  it "exists" do
    expect(@service).to be_a(FoodService)
  end

  it "returns foods results for a search query" do
    response = File.read("spec/fixtures/sweet_potatoes_foods.json")
    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV["FDC_API_KEY"]}&pageNumber=1&pageSize=10&query=sweet%20potatoes").
      to_return(status: 200, body: response, headers: {})

    query = "sweet potatoes"
    results = @service.get_foods_results(query)

    expect(results[:foods].size).to be <= 10
    expect(results[:foods][0]).to have_key(:gtinUpc)
    expect(results[:foods][0][:gtinUpc]).to be_a(String)
    expect(results[:foods][0]).to have_key(:description)
    expect(results[:foods][0][:description]).to be_a(String)
    expect(results[:foods][0]).to have_key(:brandOwner)
    expect(results[:foods][0][:brandOwner]).to be_a(String)
    expect(results[:foods][0]).to have_key(:ingredients)
    expect(results[:foods][0][:ingredients]).to be_a(String)
  end
end
