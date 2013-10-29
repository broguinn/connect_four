require 'rspec'
require 'player'
require 'token'
require 'column'
require 'board'

describe Board do
  it 'is initialized with a height and width' do
    board = Board.new(1, 1)
    board.should be_an_instance_of Board
  end

  it 'has columns' do 
    board = Board.new(2, 1)
    board.columns.length.should eq 2
  end

  describe 'winner?' do
    it 'returns false if the token does not create a winning condition' do
      board = Board.new(9, 7)
      board.columns[2].add_token("&")
      board.winner?(board.columns[2].slots.last, 4).should be_false
    end

    it 'returns true if a vertical winning condition exists' do
      board = Board.new(9, 7)
      board.columns[0].add_token("&")
      board.columns[0].add_token("&")
      board.columns[0].add_token("&")
      board.columns[0].add_token("&")
      board.winner?(board.columns[0].slots.last, 4).should be_true
    end

    it 'returns true if a left horizontal winning condition exists' do
      board = Board.new(9, 7)
      board.columns[0].add_token("&")
      board.columns[1].add_token("&")
      board.columns[2].add_token("&")
      board.columns[3].add_token("&")
      board.winner?(board.columns[3].slots.last, 4).should be_true
    end

    it 'returns true if a right horizontal winning condition exists' do
      board = Board.new(9, 7)
      board.columns[0].add_token("&")
      board.columns[1].add_token("&")
      board.columns[2].add_token("&")
      board.columns[3].add_token("&")
      board.winner?(board.columns[0].slots.last, 4).should be_true
    end

    it 'returns true if a middle horizontal winning condition exists' do 
      board = Board.new(9, 7)
      board.columns[0].add_token("&")
      board.columns[1].add_token("&")
      board.columns[2].add_token("&")
      board.columns[3].add_token("&")
      board.winner?(board.columns[2].slots.last, 4).should be_true
    end

    it 'returns false if a horizontal winning condition does not exist' do 
      board = Board.new(9, 7)
      board.columns[0].add_token("&")
      board.columns[0].add_token("#")
      board.columns[1].add_token("&")
      board.winner?(board.columns[1].slots.last, 4).should be_false
    end

    it 'returns false if there is not a horizontal winning condition' do 
      board = Board.new(9, 7)
      board.columns[0].add_token("&")
      board.columns[1].add_token("&")
      board.columns[2].add_token("$")
      board.columns[3].add_token("&")
      board.winner?(board.columns[3].slots.last, 4).should be_false
    end

    it 'handles empty spaces in a horizontal row' do 
      board = Board.new(9, 7)
      board.columns[0].add_token("&")
      board.columns[1].add_token("&")
      board.columns[3].add_token("&")
      board.columns[4].add_token("&")
      board.winner?(board.columns[3].slots.last, 4).should be_false
    end

    it 'returns true if negative slope condition exists' do 
      board = Board.new(9, 7)
      board.columns[0].add_token("&")
      board.columns[0].add_token("&")
      board.columns[0].add_token("&")
      board.columns[0].add_token("^")
      board.columns[1].add_token("&")
      board.columns[1].add_token("&")
      board.columns[1].add_token("^")
      board.columns[2].add_token("&")
      board.columns[2].add_token("^")
      board.columns[3].add_token("^")
      board.winner?(board.columns[3].slots.last, 4).should be_true
    end

    it 'returns true if negative slope condition exists' do 
      board = Board.new(9, 7)
      board.columns[0].add_token("&")
      board.columns[0].add_token("&")
      board.columns[0].add_token("&")
      board.columns[0].add_token("^")
      board.columns[1].add_token("&")
      board.columns[1].add_token("&")
      board.columns[1].add_token("^")
      board.columns[2].add_token("&")
      board.columns[2].add_token("^")
      board.columns[3].add_token("^")
      board.winner?(board.columns[0].slots.last, 4).should be_true
    end

    it 'returns true if positive slope condition exists' do 
      board = Board.new(9, 7)
      board.columns[3].add_token("&")
      board.columns[3].add_token("&")
      board.columns[3].add_token("&")
      board.columns[3].add_token("^")
      board.columns[2].add_token("&")
      board.columns[2].add_token("&")
      board.columns[2].add_token("^")
      board.columns[1].add_token("&")
      board.columns[1].add_token("^")
      board.columns[0].add_token("^")
      board.winner?(board.columns[3].slots.last, 4).should be_true
    end

    it 'returns true if positive slope condition exists' do 
      board = Board.new(9, 7)
      board.columns[3].add_token("&")
      board.columns[3].add_token("&")
      board.columns[3].add_token("&")
      board.columns[3].add_token("^")
      board.columns[2].add_token("&")
      board.columns[2].add_token("&")
      board.columns[2].add_token("^")
      board.columns[1].add_token("&")
      board.columns[1].add_token("^")
      board.columns[0].add_token("^")
      board.winner?(board.columns[0].slots.last, 4).should be_true
    end
  end

  # describe 'get_vertical_neighbors' do
  #   it 'gets all the neighbors of a token that are in the same column and within three spaces' do 
  #     board = Board.new(9, 7)
  #     board.columns[0].add_token("&")
  #     board.columns[0].add_token("&")
  #     board.columns[0].add_token("&")
  #     board.columns[0].add_token("&")
  #     board.get_vertical_neighbors(board.columns[0].slots.last).should eq board.columns[0].slots
  #   end
  # end

  # describe 'connect_winner?' do 
  #   it 'is false if the array does not have enough matching tokens' do 
  #     board = Board.new(9, 7)
  #     board.columns[0].add_token("$")
  #     board.connect_winner?(4, board.get_vertical_neighbors(board.columns[0].slots.last)).should eq false
  #   end

  #   it 'is true if the array has enough consecutive matching tokens' do
  #     board = Board.new(9, 7)
  #     board.columns[0].add_token("&")
  #     board.columns[0].add_token("&")
  #     board.columns[0].add_token("&")
  #     board.columns[0].add_token("&")
  #     board.connect_winner?(board.columns[0].slots.last, board.get_vertical_neighbors(board.columns[0].slots.last)).should eq true
  #   end 
  # end
end