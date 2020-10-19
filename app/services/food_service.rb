class FoodService
  def get_foods_results(query)
    response = conn.get("v1/foods/search") do |req|
      req.params["api_key"] = ENV["FDC_API_KEY"]
      req.params["query"] = query
      req.params["pageNumber"] = 1
      req.params["pageSize"] = 10
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.nal.usda.gov/fdc/")
  end
end
