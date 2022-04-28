class BoardCase
  attr_accessor :board_case_id, :board_case_string
  #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case

  
  def initialize(board_case_id, board_case_string = " ")
    @board_case_id = board_case_id
    @board_case_string = board_case_string
    
    #TO DO : doit régler sa valeur, ainsi que son numéro de case
  end
  
end