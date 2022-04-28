class Show

  def show_board(board)

    puts "--|" + "-"*17
    puts "A |  #{board.board_cases[0].board_case_string}  |  #{board.board_cases[3].board_case_string}  |  #{board.board_cases[6].board_case_string}"
    puts "--|" + "-"*17
    puts "B |  #{board.board_cases[1].board_case_string}  |  #{board.board_cases[4].board_case_string}  |  #{board.board_cases[7].board_case_string}"
    puts "--|" + "-"*17
    puts "C |  #{board.board_cases[2].board_case_string}  |  #{board.board_cases[5].board_case_string}  |  #{board.board_cases[8].board_case_string}"
    puts "--|" + "-"*17
    puts "  |" + "  1  |  2  |  3  "
    #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
  end

end