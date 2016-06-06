class Board
  def initialize
    @board = []
    6.times do
      row = []
      7.times do
        row << nil
      end
      @board << row
    end
  end

  def board
    @board
  end

  def column_translator(column)
    if column.upcase == 'A'
      0
    elsif column.upcase == 'B'
      1
    elsif column.upcase == 'C'
      2
    elsif column.upcase == 'D'
      3
    elsif column.upcase == 'E'
      4
    elsif column.upcase == 'F'
      5
    elsif column.upcase == 'G'
      6
    else
      "Incorrect column reference!"
    end
  end

  # find last empty spot (row index) in the column
  def last_in_column(column_index)
    token_row_coordinate = nil
    @board.each_with_index do |row, index|
      if row[column_index].nil?
        token_row_coordinate = index
      end
    end
    token_row_coordinate
    # since column index is given, returns only the row index of
    # where the token 'drops' for the column
  end

  def add_turn(player, column)
    column_index = column_translator(column)
    row_index = last_in_column(column_index)
    @board[row_index][column_index] = player
  end

  def print
    board_print = ""
    @board.each do |row|
      row.each_with_index do |space, index|
        if index < row.size - 1
          if space.nil?
            board_print << "| - "
          else
            board_print << "| #{space} "
          end
        else
          if space.nil?
            board_print << "| - |\n"
          else
            board_print << "| #{space} |\n"
          end
        end
      end
    end
    board_print << "  A   B   C   D   E   F   G "
    board_print
  end

  def has_empty_spaces?
  end

  def winner?
  end
end
