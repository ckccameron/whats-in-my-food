class SearchFacade
  def self.foods_search(query)
    results = service.get_foods_results(query)[:foods]
    results.map { |food_result_info| food(food_result_info) }
  end

  def self.service
    FoodService.new
  end

  def self.food(food_result_info)
    Food.new(food_result_info)
  end

end
