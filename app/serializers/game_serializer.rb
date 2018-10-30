class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [{user_id: object.player_1_id,
      score:  ""
     },
    {user_id: object.player_1_id,
      score: ""
    }]
  end

  private

  def total_score(player)
    player.plays.inject(0) do |sum, play|
      sum += play.score
    end
  end

end
