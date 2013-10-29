class Game
  attr_reader :players, :board, :current_player

  def initialize(players, width, height)
    @possible_symbols = ["$", "*", "%", "&"]
    @players = []
    players.times do
      player = Player.new(@possible_symbols.pop)
      @players << player
    end
    @current_player = @players.first
    @board = Board.new(width, height)
  end

  def switch_player
    @players.rotate!
    @current_player = @players.first
  end
end
