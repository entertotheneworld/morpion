class Application

  # LANCE LE JEU
  def perform
    game = Game.new
    while game.status == "on going"
      game.turn
    end
    game.game_end(game.status, game.current_player)
  end

end