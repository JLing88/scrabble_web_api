require 'rails_helper'

describe 'As a user' do
  describe 'they send a request to /api/v1/games/1' do
    it "returns the correct JSON response" do
      user_1 = create(:user)
      user_2 = create(:user)

      game = create(:game, player_1: user_1, player_2: user_2)
      get "/api/v1/games/#{game.id}"

      result = JSON.parse(response.body)
      expect(result["game_id"]).to eq(game.id)
      expect(result["scores"].first["user_id"]).to eq(user_1.id)
      expect(result["scores"].first["score"]).to eq(7)
      expect(result["scores"].last["user_id"]).to eq(user_2.id)
      expect(result["scores"].last["score"]).to eq(7)
    end
  end
end

# When I send a GET request to “/api/v1/games/1” I receive a JSON response as follows:

# ```{
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":15
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }```