module Api 
  module V1  
   class GamesController < ApplicationController
      def show
        render json: Game.find(params[:id])
      end
    end
  end
end