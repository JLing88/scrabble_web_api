class SearchController < ApplicationController
  def show
    @facade = SentencesFacade.new(params[:p])
  end
end