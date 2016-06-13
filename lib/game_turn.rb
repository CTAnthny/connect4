require_relative '../spec/spec_helper'

class GameTurn
  attr_reader :board, :player, :row_index, :col_index

  def initialize(board, player, row_index, col_index)
    @board = board
    @player = player
    @row_index = row_index
    @col_index = col_index
  end

  def take!
    @board.board[@row_index][@col_index].player = @player
  end

  def winner?
    horizontal_win? || vertical_win? || diagonal_win_left? || diagonal_win_right?
  end

  def horizontal_win?
    # get row index, iterate over each space in row, increment a counter if
    # player token in space matches previous space; for a winning turn, #take!
    # on the fourth consecutive match, win
    token_match_counter = 0
    player_token = @player.character
    adjacent_counter = 1
    # loop for match to the left of take! move
    while true || token_match_counter < 3
      if on_board?(@row_index, @col_index - adjacent_counter) &&
      @board.board[@row_index][@col_index - adjacent_counter].token == player_token
        adjacent_counter += 1
        token_match_counter += 1
      else
        break
      end
    end

    # loop for match to the right of take! move
    adjacent_counter = 1
    while true || token_match_counter < 3
      if on_board?(@row_index, @col_index + adjacent_counter) &&
      @board.board[@row_index][@col_index + adjacent_counter].token == player_token
        adjacent_counter += 1
        token_match_counter += 1
      else
        break
      end
    end

    # return boolean as to whether 3 matches have been found including take! move
    token_match_counter == 3
  end

  def vertical_win?
    token_match_counter = 0
    player_token = @player.character
    adjacent_counter = 1
    # loop for match below the take! move
    while true || token_match_counter < 3
      if on_board?(@row_index + adjacent_counter, @col_index) &&
      @board.board[@row_index + adjacent_counter][@col_index].token == player_token
        adjacent_counter += 1
        token_match_counter += 1
      else
        break
      end
    end

    # loop for match above the take! move
    adjacent_counter = 1
    while true || token_match_counter < 3
      if on_board?(@row_index - adjacent_counter, @col_index) &&
      @board.board[@row_index - adjacent_counter][@col_index].token == player_token
        adjacent_counter += 1
        token_match_counter += 1
      else
        break
      end
    end

    token_match_counter == 3
  end

  def diagonal_win_left?
    token_match_counter = 0
    player_token = @player.character
    adjacent_counter = 1
    # loop for match diagonally towards bottom-right from the take! move
    while true || token_match_counter < 3
      if on_board?(@row_index + adjacent_counter, @col_index + adjacent_counter) &&
      @board.board[@row_index + adjacent_counter][@col_index + adjacent_counter].token == player_token
        adjacent_counter += 1
        token_match_counter += 1
      else
        break
      end
    end

    # loop for match diagonally towards top-left from the take! move
    adjacent_counter = 1
    while true || token_match_counter < 3
      if on_board?(@row_index - adjacent_counter, @col_index - adjacent_counter) &&
      @board.board[@row_index - adjacent_counter][@col_index - adjacent_counter].token == player_token
        adjacent_counter += 1
        token_match_counter += 1
      else
        break
      end
    end

    token_match_counter == 3
  end

  def diagonal_win_right?
    token_match_counter = 0
    player_token = @player.character
    adjacent_counter = 1
    # loop for match diagonally towards bottom-left from the take! move
    while true || token_match_counter < 3
      if on_board?(@row_index + adjacent_counter, @col_index - adjacent_counter) &&
      @board.board[@row_index + adjacent_counter][@col_index - adjacent_counter].token == player_token
        adjacent_counter += 1
        token_match_counter += 1
      else
        break
      end
    end

    # loop for match diagonally towards top-right from the take! move
    adjacent_counter = 1
    while true || token_match_counter < 3
      if on_board?(@row_index - adjacent_counter, @col_index + adjacent_counter) &&
      @board.board[@row_index - adjacent_counter][@col_index + adjacent_counter].token == player_token
        adjacent_counter += 1
        token_match_counter += 1
      else
        break
      end
    end

    token_match_counter == 3
  end

  def on_board?(row, col)
    return row >= 0 && col >= 0 && row <= 5 && col <= 6
  end
end
