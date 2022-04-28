class Game
  attr_accessor :current_player, :status, :board, :players
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.

  def initialize(status = "on going", players = [])
    
    @status = status
    @board = Board.new
    @players = players
    create_player1
    create_player2
    @current_player = @players[0]
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
  end

  def create_player1
    puts "-"*22
    puts "|      Joueur 1      |"
    puts "-"*22
    puts "Entrez votre nom :"
    print "> "
    name = gets.chomp 
    puts "Choisissez votre symbol :"
    puts "\t1. X"
    puts "\t2. O"
    print "> "
    symbol = gets.chomp.to_i
    until symbol == 1 || symbol == 2
      puts "ERROR, veuillez choisir 1 ou 2 :"
      print "> "
      symbol = gets.chomp.to_i
    end
    (symbol == 1) ? (symbol = "X") : (symbol = "0")
    player1 = Player.new(name, symbol)
    @players << player1
  end

  def create_player2
    puts "-"*22
    puts "|      Joueur 2      |"
    puts "-"*22
    puts "Entrez votre nom :"
    print "> "
    name = gets.chomp 
    if @players[0].symbol == "X"
      puts "Le joueur 1 à choisis le symbol : X"
      puts "Votre symbol sera donc : O"
      symbol = "O"
      player2 = Player.new(name, symbol)
      @players << player2
    else 
      puts "Le joueur 1 à choisis le symbol : O"
      puts "Votre symbol sera donc : X"
      symbol = "X"
      player2 = Player.new(name, symbol)
      @players << player2
    end
  end

  def turn
    system('clear')
    Show.new.show_board(@board)
    @board.play_turn(@current_player)

    if @board.victory? == false
      (@board.count_turn.even?) ? (@current_player = @players[0]) : (@current_player = @players[1])

     
    else 
      puts "partie terminé"
      @status = "finish"
    end
    
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  end    

end