class SearchController < ApplicationController
  def show
    word = params[:p]
    conn = Faraday.new( url: "https://od-api.oxforddictionaries.com/api/v1") do |faraday|
      faraday.headers["app_id"] = ENV["app_id"]
      faraday.headers["app_key"] = ENV["app_key"]
      faraday.headers["Accept"] = "application/json"
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("entries/en/#{word}/sentences")
    result = JSON.parse(response.body)
    @sentences = result["results"].first["lexicalEntries"].first["sentences"].map do |sentence|
      if sentence["regions"].include?("British") || sentence["regions"].include?("Canadian")
        Sentence.new(sentence)
      end
    end.compact
    binding.pry
  end
end