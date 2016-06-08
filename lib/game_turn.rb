require_relative '../spec/spec_helper'

class GameTurn
  attr_reader :board, :player, :col_index

  def initialize(board, player, col_index)
    @board = board
    @player = player
  # @row_index = row_index
    @col_index = col_index
  end

  # def take!
  #   @board.board[@row_index][@col_index].player = @player
  # end

  # def winner?
  #   horizontal_win? || vertical_win? || diagonal_win?
  # end

  # def horizontal_win?
  # end
  #
  # def vertical_win?
  # end
  #
  # def diagonal_win?
  # end
end
