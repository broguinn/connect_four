require 'rspec'
require 'token'
require 'player'
require 'column'

describe Player do 
  it "is initialized with a symbol argument" do
    player = Player.new("$")
    player.should be_an_instance_of Player
  end

  it "has a symbol" do
    player = Player.new("~")
    player.symbol.should eq "~"
  end

  describe "set_name" do
    it "sets the name of the player" do 
      player = Player.new("&")
      player.set_name("Frank")
      player.name.should eq "Frank"
    end
  end
end