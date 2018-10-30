class SearchController < ApplicationController
  def show
    Faraday.new(
      url: "https://od-api.oxforddictionaries.com/api/v1",
      headers: {"app_id" = ENV["app_id"], "app_key" = ENV["app_key"], "Accept" = "application/json"}
                ) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    @search = SearchFacade.new(params[:p])
  end
end