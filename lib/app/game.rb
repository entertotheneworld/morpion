class Game
  attr_accessor :current_player, :status, :board, :players, :new_part

  # INITIALISATION DU JEU
  def initialize(status = "on going", players = [], new_part = true)
    @new_part = new_part
    @status = status
    @board = Board.new
    @players = players
    welcome
    create_player1
    create_player2
    @current_player = @players[0]
  end

  # MESSAGE DEBUT DE PARTIE
  def welcome
    system('clear')
    puts "-----------------------------------".white.on_black
    puts "|                                 |".white.on_black
    puts "|      BIENVENUE AU MORPION       |".white.on_black
    puts "|                                 |".white.on_black
    puts "-----------------------------------".white.on_black
    puts "\n\n"
    puts "------------------------------".white.on_blue
    puts "| INITIALISATION DES JOUEURS |".white.on_blue
    puts "------------------------------".white.on_blue
  end

  # INITIALISATION DU PREMIER JOUEUR
  def create_player1
    puts "\n"
    puts "----------------------".white.on_red
    puts "|      Joueur 1      |".white.on_red
    puts "----------------------".white.on_red
    puts "\nEntrez votre nom :"
    print "> "
    name = gets.chomp

    puts "\nChoisissez votre symbol :"
    puts "\t1. X\t2. O\t3. \u{1f600}\t4. \u{1f609}"
    print "> "
    symbol = gets.chomp.to_i
    until symbol == 1 || symbol == 2 || symbol == 3 || symbol == 4
      puts "\nERROR, veuillez choisir un chiffre entre 1 et 4 :"
      print "> "
      symbol = gets.chomp.to_i
    end
    @number_symbol_player1 = symbol
    case symbol
    when 1
      symbol = "X"
    when 2
      symbol = "0"
    when 3
      symbol = "\u{1f600}"
    when 4
      symbol = "\u{1f609}"
    end
    @player1 = Player.new(name, symbol)
    @players << @player1
  end

  # INITIALISATION DU DEUXIEME JOUEUR
  def create_player2
    puts "\n\n"
    puts "----------------------".white.on_red
    puts "|      Joueur 2      |".white.on_red
    puts "----------------------".white.on_red
    puts "\nEntrez votre nom :"
    print "> "
    name = gets.chomp

    puts "\nChoisissez votre symbol :"
    puts "\t1. X\t2. O\t3. \u{1f600}\t4. \u{1f609}"
    print "> "
    symbol = gets.chomp.to_i
    until (symbol == 1 || symbol == 2 || symbol == 3 || symbol == 4) && @number_symbol_player1 != symbol
      puts "\nERROR, veuillez choisir un chiffre entre 1 et 4 ou ne choisissez pas le même symbol que #{@players[0].name}"
      print "> "
      symbol = gets.chomp.to_i
    end

    case symbol
    when 1
      symbol = "X"
    when 2
      symbol = "0"
    when 3
      symbol = "\u{1f600}"
    when 4
      symbol = "\u{1f609}"
    end

    player2 = Player.new(name, symbol)
    @players << player2

    puts "\n Pressez entrez pour commencer la partie :"
    print "> "
    gets.chomp
  end

  # LANCE UNE PARTIE
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

  # RELANCE UNE PARTIE AVEC LES MEME JOUEUR
  def new_round
    puts "\nVoulez vous refaire une partie ?"
    puts "\t1. Oui\tNon"
    print "> "
    new_part = gets.chomp.to_i
    until new_part == 1 || new_part == 2
      puts "ERROR, veuillez réessayer"
      new_part = gets.chomp.to_i
    end

    if new_part == 1
      @status = "on going"
      @board = Board.new
    else
      @new_part = false
    end
  end

  # CHERCHE SI UNE PARTIE EST TERMINEE
  def game_end(status, player)
    case status 
    when "draw"
      puts "\n\n"
      puts "-----------------------------------".white.on_black
      puts "|                                 |".white.on_black
      puts "|           MATCH NUL             |".white.on_black
      puts "|                                 |".white.on_black
      puts "-----------------------------------".white.on_black
    when true
      puts "\n\n"
      puts "-----------------------------------".white.on_black
      puts "|                                 |".white.on_black
      puts "|       Félicitation #{player.name}      |".white.on_black
      puts "|        VICTOIRE EN #{@board.count_turn} TOURS      |".white.on_black
      puts "-----------------------------------".white.on_black
    end
  end
  
  def final_end
    system('clear')
    puts "-----------------------------------".white.on_black
    puts "|                                 |".white.on_black
    puts "|           à bientôt             |".white.on_black
    puts "|                                 |".white.on_black
    puts "-----------------------------------".white.on_black
  end
end