class Application
  def perform
    jeu = Game.new
    for i in 1..9
    jeu.turn
    end
    # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
    # 

  end

end