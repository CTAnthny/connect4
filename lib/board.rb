require_relative '../spec/spec_helper'

class Board
  def initialize
    @board = []
    6.times do
      row = []
      7.times do
        row << BoardSpace.new
      end
      @board << row
    end
  end

  def board
    @board
  end

  def column_translator(column)
    if !column.is_a?(Integer)
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
      end
    elsif column.is_a?(Integer) && column >= 0 && column <= 6
      column
    end
  end

  # find last empty spot (row index) in the column
  def last_in_column(column_index)
    token_row_coordinate = nil
    @board.each_with_index do |row, index|
      if !row[column_index].occupied?
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
    @last_turn = GameTurn.new(self, player, row_index, column_index)
    @last_turn.take!
  end

  def valid_move?(column)
    column_index = column_translator(column)
    if column_index.is_a?(Integer) && !last_in_column(column_index).nil?
      true
    else
      false
    end
  end

  def printer
    board_print = ""
    @board.each do |row|
      row.each_with_index do |space, index|
        if index < row.size - 1
          if !space.occupied?
            board_print << "| #{space.token} "
          else
            board_print << "| #{space.token} "
          end
        else
          if !space.occupied?
            board_print << "| #{space.token} |\n"
          else
            board_print << "| #{space.token} |\n"
          end
        end
      end
    end
    board_print << "  A   B   C   D   E   F   G "
    board_print
  end

  def has_empty_spaces?
    spaces = false
    @board.each do |row|
      row.each do |column|
        if !column.occupied?
          spaces = true
        end
      end
    end
    spaces
  end

  def winner?
    if @last_turn
      @last_turn.winner?  # (called from game_turn class)
    else
      false
    end
  end

  private :last_in_column, :column_translator

end
