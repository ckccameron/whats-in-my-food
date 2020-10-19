class Food
  attr_reader :code,
              :description,
              :brand_owner,
              :ingredients

  def initialize(food_result_info)
    @code = food_result_info[:gtinUpc]
    @description = food_result_info[:description]
    @brand_owner = food_result_info[:brandOwner]
    @ingredients = food_result_info[:ingredients]
  end
end
