class Token
  attr_reader :column_number, :row_number, :symbol

  def initialize(column_number=nil, row_number=nil, symbol=nil)
    @column_number = column_number
    @row_number = row_number
    @symbol = symbol
  end
end