require_relative 'spec_helper.rb'

describe GameTurn do
  let(:board) { Board.new }
  let(:player) { Player.new('x') }
  let(:opposing_player) { Player.new('o') }
  let(:row_index) { 0 }
  let(:col_index) { 0 }
  let(:turn) { GameTurn.new(board, player, row_index, col_index) }

  it 'has a board' do
    expect(turn.board).to eq(board)
  end

  it 'has a player' do
    expect(turn.player).to eq(player)
  end

  it 'has a row index' do
    expect(turn.row_index).to eq(row_index)
  end

  it 'has a column index' do
    expect(turn.col_index).to eq(col_index)
  end

  context 'checking for win conditions' do
    context 'horizontal' do
      it 'is a win if a row of 4 of the same player is found' do
        winning_board = Board.new
        3.times do |col_index|
          winning_board.add_turn(player, col_index)
        end

        winning_turn = GameTurn.new(winning_board, player, 5, 3)
        winning_turn.take!
        expect(winning_turn).to be_winner
        # expect(winning_turn.winner?).to be(true)
      end

      it 'is not a win if a row of 4 is interrupted by another player' do
        losing_board = Board.new
        2.times do |col_index|
          losing_board.add_turn(player, col_index)
        end

        losing_board.add_turn(opposing_player, 2)
        losing_turn = GameTurn.new(losing_board, player, 5, 3)
        losing_turn.take!
        expect(losing_turn).to_not be_winner
      end

      it 'is a win if a row of 4 of the same player is found in the middle of the row' do
        winning_board = Board.new
        winning_board.add_turn(player, 2)
        winning_board.add_turn(player, 4)
        winning_board.add_turn(player, 5)

        winning_turn = GameTurn.new(winning_board, player, 5, 3)
        winning_turn.take!
        expect(winning_turn).to be_winner
      end
    end

    context 'vertical' do
      it 'is a win if a player has 4 in a line in the column' do
        winning_board = Board.new
        3.times do
          winning_board.add_turn(player, 3)
        end

        winning_turn = GameTurn.new(winning_board, player, 2, 3)
        winning_turn.take!
        expect(winning_turn).to be_winner
      end

      it 'is not a win if a line is interrupted by another player' do
        losing_board = Board.new
        2.times do
          losing_board.add_turn(player, 3)
        end

        losing_board.add_turn(opposing_player, 3)
        losing_turn = GameTurn.new(losing_board, player, 2, 3)
        losing_turn.take!
        expect(losing_turn).to_not be_winner
      end

      it 'is a win if a player has 4 in a line in the far left column' do
        winning_board = Board.new
        3.times do
          winning_board.add_turn(player, 0)
        end

        winning_turn = GameTurn.new(winning_board, player, 2, 0)
        winning_turn.take!
        expect(winning_turn).to be_winner
      end

      it 'is a win if a player has 4 in a line near the top of the column' do
        winning_board = Board.new
        winning_board.add_turn(player, 3)
        winning_board.add_turn(opposing_player, 3)
        3.times do
          winning_board.add_turn(player, 3)
        end

        winning_turn = GameTurn.new(winning_board, player, 0, 3)
        winning_turn.take!
        expect(winning_turn).to be_winner
      end
    end

    context 'diagonal' do
      it 'is a win if a player has 4 in a diagonal line'
      it 'is not a win if a diagonal line is interrupted by another player'
    end
  end
end
