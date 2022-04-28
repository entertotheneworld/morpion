require_relative '../lib/app/player.rb'

describe "initialize new player" do 
  it "create new player" do 
    expect(Player.new("Nicolas", "X").name).to eq("Nicolas")
    expect(Player.new("Nicolas", "O").symbol).to eq("O")
  end
end