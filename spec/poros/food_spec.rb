require 'rails_helper'

describe Food do
  before :each do
    @food_result_info = {
                          gtinUpc: "070560951975",
                          description: "SWEET POTATOES",
                          brandOwner: "The Pictsweet Company",
                          ingredients: "SWEET POTATOES."
                        }
    @food = Food.new(@food_result_info)
  end
  it "exists with attributes" do
    expect(@food).to be_a(Food)
    expect(@food.code).to eq("070560951975")
    expect(@food.description).to eq("SWEET POTATOES")
    expect(@food.brand_owner).to eq("The Pictsweet Company")
    expect(@food.ingredients).to eq("SWEET POTATOES.")
  end
end
