
class Board
  attr_accessor :board_cases, :count_turn
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué


  def initialize(board_cases = [], count_turn = 0)
    @count_turn = count_turn
    @board_cases = board_cases
    for i in 1..9
      @board_cases << BoardCase.new(i)
    end
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
  end

  def play_turn(player)
    puts "#{player.name} choisissez une case "
    tab_choice = ["A1", "B1", "C1", "A2", "B2", "C2", "A3", "B3", "C3", ]
    tab_choice.each_with_index {|choice, i| puts "\t#{i + 1}. #{choice}"}
    print "> "
    choice = gets.chomp.to_i
    until (1..9).cover?(choice) && @board_cases[choice - 1].board_case_string == " "
      puts "Choisissez une case valide :"
      choice = gets.chomp.to_i
    end
    ()
    @board_cases[choice - 1].board_case_string = player.symbol
    @count_turn += 1
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
  end

  def victory?
    (@count_turn == 9) ? (return true) : (return false)

    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
  end

end