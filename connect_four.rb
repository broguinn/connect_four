require './lib/game'
require './lib/board'
require './lib/player'
require './lib/column'
require './lib/token'

def init
  puts "Welcome to Connect Four! How many people are playing?"
  players = gets.chomp.to_i
  @game = Game.new(players)
  main
end

def main
  draw_board
  puts "\nSelect a column you would like to drop a token into"
  column_choice = player_choice
  if @game.board.winner?(@game.board.columns[column_choice - 1].slots.last, 4)
    draw_board
    puts "#{@game.current_player.symbol} has won!!!"
  else
    @game.switch_player
    main
  end
end

def player_choice
  column_choice = gets.to_i
  if !(1..@game.board.width).include?(column_choice) || @game.board.columns[column_choice - 1].full?
    puts "\nPlease select a different column."
    player_choice
  else
    @game.board.columns[column_choice - 1].add_token(@game.current_player.symbol)
  end

  column_choice
end

def draw_board
  @game.board.height.times do |row_diff|
    print "|"
    @game.board.columns.each do |column|
      if column.slots[@game.board.height - row_diff - 1].nil?
        print " "
      else
        print column.slots[@game.board.height - row_diff - 1].symbol
      end
      print " | "
    end
    puts ""
    puts "====" * @game.board.width
  end
  @game.board.width.times do |time|
    print " #{time + 1}  "
  end
  puts ""
end

init
