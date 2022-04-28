require_relative '../lib/app/board_case.rb'

describe "initialize board case" do 
  it "create new case" do 
    expect(BoardCase.new("A1").board_case_string).to eq(" ")
    expect(BoardCase.new("C1").board_case_id).to eq("C1")
  end
end