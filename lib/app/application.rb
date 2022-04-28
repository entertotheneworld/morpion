class Application

  # LANCE LE JEU
  def perform
    game = Game.new
    while game.new_part == true
      while game.status == "on going"
        game.turn
      end
      game.game_end(game.status, game.current_player)
      game.new_round
    end
    game.final_end
  end

end