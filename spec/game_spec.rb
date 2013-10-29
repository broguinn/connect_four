require 'rspec'
require 'game'
require 'board'
require 'player'
require 'column'
require 'token'

describe Game do
  it 'initializes with a number of players, board height and width' do
    game = Game.new(2, 9, 7)
    game.should be_an_instance_of Game
  end

  it 'has players' do 
    game = Game.new(2, 9, 7)
    game.players.length.should eq 2
  end

  it 'has a board'  do
    game = Game.new(2, 9, 7)
    game.board.should be_an_instance_of Board
  end

  it 'has a current player' do 
    game = Game.new(2, 9, 7)
    game.current_player.should eq game.players[0]
  end

  describe 'switch_player' do 
    it 'switches the current player' do 
      game = Game.new(2, 9, 7)
      game.switch_player
      game.current_player.symbol.should eq "%"
    end
  end
end