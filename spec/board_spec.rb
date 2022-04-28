require_relative '../lib/app/board.rb'

describe "initialize new board" do 
  it "create new board" do 
    expect(Board.new.board_cases.length).to eq(9)
    expect(Board.new.count_turn).to eq(0)
  end
end