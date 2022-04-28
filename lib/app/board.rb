
class Board
  attr_accessor :board_cases, :count_turn

  # INITIALISATION DU PLATEAU DE JEU
  def initialize(board_cases = [], count_turn = 0)
    @count_turn = count_turn
    @board_cases = board_cases
    for i in 1..3
      @board_cases << BoardCase.new("A#{i}")
      @board_cases << BoardCase.new("B#{i}")
      @board_cases << BoardCase.new("C#{i}")
    end
  end

  # UN TOUR DE JEU
  def play_turn(player)
    puts "\n#{player.name} choisissez une case :"
    tab_choice = ["A1", "B1", "C1", "A2", "B2", "C2", "A3", "B3", "C3", ]
    tab_choice.each_with_index {|choice, i| print "\t#{i + 1}. #{choice}"}
    print "\n> "
    choice = gets.chomp.to_i
    until (1..9).cover?(choice) && @board_cases[choice - 1].board_case_string == " "
      puts "\nChoisissez une case valide :"
      choice = gets.chomp.to_i
    end
    @board_cases[choice - 1].board_case_string = player.symbol
    @count_turn += 1
  end

  # VERIFIE SI IL Y AS UN GAGNANT OU UN MATCH NUL
  def victory?(player)
    (@count_turn == 9) ? (return "draw") : (return false)
    (@board_cases[0].board_case_string + @board_cases[1].board_case_string + @board_cases[2].board_case_string == player) ? (return true) : (return false)
    (@board_cases[3].board_case_string + @board_cases[4].board_case_string + @board_cases[5].board_case_string == player) ? (return true) : (return false)
    (@board_cases[6].board_case_string + @board_cases[7].board_case_string + @board_cases[8].board_case_string == player) ? (return true) : (return false)
    (@board_cases[0].board_case_string + @board_cases[3].board_case_string + @board_cases[6].board_case_string == player) ? (return true) : (return false)
    (@board_cases[1].board_case_string + @board_cases[4].board_case_string + @board_cases[7].board_case_string == player) ? (return true) : (return false)
    (@board_cases[2].board_case_string + @board_cases[5].board_case_string + @board_cases[8].board_case_string == player) ? (return true) : (return false)
    (@board_cases[0].board_case_string + @board_cases[4].board_case_string + @board_cases[8].board_case_string == player) ? (return true) : (return false)
  end

end