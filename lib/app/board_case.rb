class BoardCase
  attr_accessor :board_case_id, :board_case_string

  # INITIALISATION D'UNE CASE DU PLATEAU D'AFFICHAGE
  def initialize(board_case_id, board_case_string = " ")
    @board_case_id = board_case_id
    @board_case_string = board_case_string
  end
  
end