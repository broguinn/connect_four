class Board
  attr_reader :columns, :height, :width

  def initialize(width=9, height=7)
    @columns = []
    @height = height
    @width = width
    width.times do |position|
      column = Column.new(position, height)
      columns << column
    end
  end

  def winner?(token, win_length)
    winning_conditions = [get_vertical_matches(token) + 1,
                          get_left_matches(token) + get_right_matches(token) + 1,
                          get_negative_slope_left_diagonal_matches(token) + get_negative_slope_right_diagonal_matches(token) + 1, get_positive_slope_left_diagonal_matches(token) + get_positive_slope_right_diagonal_matches(token) + 1]
    winning_conditions.any? do |condition|
      condition >= win_length
    end
  end

  private

  def get_vertical_matches(token)
    consecutive_matches = 0
    token.row_number.times do |difference|
      if @columns[token.column_number].slots[token.row_number - difference - 1].symbol != token.symbol
        break
      else
        consecutive_matches += 1
      end
    end
    consecutive_matches
  end

  def get_left_matches(token)
    consecutive_matches = 0
    token.column_number.times do |index|
      if @columns[token.column_number - index - 1].slots[token.row_number].nil? || @columns[token.column_number - index - 1].slots[token.row_number].symbol != token.symbol
        break
      else
        consecutive_matches += 1
      end
    end
    consecutive_matches
  end

  def get_right_matches(token)
    columns_right = @columns.length - (token.column_number + 1)
    # puts "columns right: #{columns_right}"
    consecutive_matches = 0
    columns_right.times do |difference|
      # puts "column val: #{@columns[token.column_number + difference + 1].slots[token.row_number].nil?}"
      if @columns[token.column_number + difference + 1].slots[token.row_number].nil? || @columns[token.column_number + difference + 1].slots[token.row_number].symbol != token.symbol
        break
      else
        consecutive_matches += 1
      end
    end
    # puts "right matches: #{consecutive_matches}"
    consecutive_matches
  end

  def get_negative_slope_left_diagonal_matches(token)
    columns_to_zero = token.column_number
    consecutive_matches = 0
    rows_to_top = @height - token.row_number - 1
    if columns_to_zero < rows_to_top
      diagonals_to_get = columns_to_zero
    else
      diagonals_to_get = rows_to_top
    end

    diagonals_to_get.times do |difference|
      if @columns[token.column_number - difference - 1].slots[token.row_number + difference + 1].nil? || @columns[token.column_number - difference - 1].slots[token.row_number + difference + 1].symbol != token.symbol
        break
      else
        consecutive_matches += 1
      end
    end

    consecutive_matches
  end

  def get_negative_slope_right_diagonal_matches(token)
    consecutive_matches = 0
    columns_to_max = @width - token.column_number - 1
    rows_to_bottom = token.row_number
    diagonals_to_get = columns_to_max < rows_to_bottom ? columns_to_max : rows_to_bottom

    diagonals_to_get.times do |difference|
      if @columns[token.column_number + difference + 1].slots[token.row_number - difference - 1].nil? || @columns[token.column_number + difference + 1].slots[token.row_number - difference - 1].symbol != token.symbol
        break
      else
        consecutive_matches += 1
      end
    end
    consecutive_matches
  end

  def get_positive_slope_left_diagonal_matches(token)
    consecutive_matches = 0
    columns_to_zero = token.column_number
    rows_to_bottom = token.row_number

    if columns_to_zero < rows_to_bottom
      diagonals_to_get = columns_to_zero
    else
      diagonals_to_get = rows_to_bottom
    end

    diagonals_to_get.times do |difference|
      if @columns[token.column_number - difference - 1].slots[token.row_number - difference - 1].nil? || @columns[token.column_number - difference - 1].slots[token.row_number - difference - 1].symbol != token.symbol
        break
      else
        consecutive_matches += 1
      end
    end

    consecutive_matches
  end

  def get_positive_slope_right_diagonal_matches(token)
    consecutive_matches = 0
    columns_to_max = @width - token.column_number - 1
    rows_to_top = @height - token.row_number - 1

    diagonals_to_get = columns_to_max < rows_to_top ? columns_to_max : rows_to_top

    diagonals_to_get.times do |difference|
      if @columns[token.column_number + difference + 1].slots[token.row_number + difference + 1].nil? || @columns[token.column_number + difference + 1].slots[token.row_number + difference + 1].symbol != token.symbol
        break
      else
        consecutive_matches += 1
      end
    end
    consecutive_matches
  end
end
