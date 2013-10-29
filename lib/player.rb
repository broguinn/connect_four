class Player
  attr_reader :symbol, :name

  def initialize(symbol)
    @symbol = symbol
  end

  def set_name(name)
    @name = name
  end
end