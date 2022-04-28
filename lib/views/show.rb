class Show

  # AFFICHAGE DU JEU
  def show_board(board)

    puts "---|----------------------------".white.on_green
    puts "   |         |         |        ".white.on_green
    puts " A |    #{board.board_cases[0].board_case_string}    |    #{board.board_cases[3].board_case_string}    |    #{board.board_cases[6].board_case_string}   ".white.on_green 
    puts "   |         |         |        ".white.on_green
    puts "---|----------------------------".white.on_green
    puts "   |         |         |        ".white.on_green
    puts " B |    #{board.board_cases[1].board_case_string}    |    #{board.board_cases[4].board_case_string}    |    #{board.board_cases[7].board_case_string}   ".white.on_green 
    puts "   |         |         |        ".white.on_green
    puts "---|----------------------------".white.on_green
    puts "   |         |         |        ".white.on_green
    puts " C |    #{board.board_cases[2].board_case_string}    |    #{board.board_cases[5].board_case_string}    |    #{board.board_cases[8].board_case_string}   ".white.on_green 
    puts "   |         |         |        ".white.on_green
    puts "---|----------------------------".white.on_green
    puts "   |    1    |    2    |    3   ".white.on_green 
    puts "   |         |         |        ".white.on_green
  end

end