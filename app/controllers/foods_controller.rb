class FoodsController < ApplicationController
  def index
    query = params[:q]
    @foods = SearchFacade.foods_search(query)
  end
end
