class Game
  attr_accessor :current_player, :status, :board, :players

  # INITIALISATION DU JEU
  def initialize(status = "on going", players = [])
    @status = status
    @board = Board.new
    @players = players
    create_player1
    create_player2
    @current_player = @players[0]
  end

  # INITIALISATION DU PREMIER JOUEUR
  def create_player1
    system('clear')
    puts "----------------------".white.on_red
    puts "|      Joueur 1      |".white.on_red
    puts "----------------------".white.on_red
    puts "\nEntrez votre nom :"
    print "> "
    name = gets.chomp 
    puts "\nChoisissez votre symbol :"
    puts "\t1. X"
    puts "\t2. O"
    print "> "
    symbol = gets.chomp.to_i
    until symbol == 1 || symbol == 2
      puts "\nERROR, veuillez choisir 1 ou 2 :"
      print "> "
      symbol = gets.chomp.to_i
    end
    (symbol == 1) ? (symbol = "X") : (symbol = "0")
    player1 = Player.new(name, symbol)
    @players << player1
  end

  # INITIALISATION DU DEUXIEME JOUEUR
  def create_player2
    puts "\n\n----------------------".white.on_red
    puts "|      Joueur 2      |".white.on_red
    puts "----------------------".white.on_red
    puts "\nEntrez votre nom :"
    print "> "
    name = gets.chomp 
    if @players[0].symbol == "X"
      puts "\n#{@players[0].name} à choisis le symbol : X"
      puts "Votre symbol sera donc : O"
      symbol = "O"
      player2 = Player.new(name, symbol)
      @players << player2
    else 
      puts "\n#{@players[0].name} à choisis le symbol : O"
      puts "Votre symbol sera donc : X"
      symbol = "X"
      player2 = Player.new(name, symbol)
      @players << player2
    end
    puts "\n Pressez entrez pour commencer la partie :"
    print "> "
    gets.chomp
  end

  def turn
    system('clear')
    Show.new.show_board(@board)
    @board.play_turn(@current_player)

    if @board.victory?(@current_player.symbol * 3) == false
      (@board.count_turn.even?) ? (@current_player = @players[0]) : (@current_player = @players[1])
    elsif @board.victory?(@current_player.symbol * 3) == true 
      @status = true
      system('clear')
      Show.new.show_board(@board)
    elsif @board.victory?(@current_player.symbol * 3) == "draw"
      @status = "draw"
      system('clear')
      Show.new.show_board(@board)
    end
  end

  # RELANCE UNE PARTIE 
  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  end

  def game_end(status, player)
    case status 
    when "draw"
      puts "Match nul"
    when true
      puts "Félicitation #{player.name}, tu la battue en #{@board.count_turn} tour"
    end
  end    

end