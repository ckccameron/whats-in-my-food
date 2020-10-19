require 'rails_helper'

describe SearchFacade do
  it "returns ten food results from query" do
    # response = File.read

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
