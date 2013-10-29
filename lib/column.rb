class Column
  attr_reader :position, :max_height, :slots

  def initialize(position, max_height)
    @position = position
    @max_height = max_height
    @slots = []
  end

  def add_token(symbol)
    token = Token.new(@position, @slots.length, symbol)
    slots << token
  end

  def full?
   @slots.length == max_height
  end
end