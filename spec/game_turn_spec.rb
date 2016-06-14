require_relative 'spec_helper.rb'

describe GameTurn do
  let(:board) { Board.new }
  let(:player) { Player.new('x') }
  let(:opposing_player) { Player.new('o') }
  let(:row_index) { 0 }
  let(:col_index) { 0 }
  let(:turn) { GameTurn.new(board, player, row_index, col_index) }
  let(:winning_board) { Board.new }
  let(:losing_board) { Board.new }

  describe "#initialize" do
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
  end

  describe "#take!" do
    it "modifies the board_space value at a certain coordinate" do
      turn.take!
      expect(board.board[row_index][col_index].player).to eq(player)
    end
  end

  describe "#winner?" do
    context "checking for win conditions" do
      describe '#horizontal_win?' do
        # let(:row_index) { 5 }
        # let(:column_index) { 3 }

      it 'is a win if a row of 4 of the same player is found' do
        3.times do |col_index|
          winning_board.add_turn(player, col_index)
        end

        winning_turn = GameTurn.new(winning_board, player, 5, 3)
        winning_turn.take!
        expect(winning_turn).to be_winner
        # expect(winning_turn.winner?).to be(true)
      end

      it 'is not a win if a row of 4 is interrupted by another player' do
        2.times do |col_index|
          losing_board.add_turn(player, col_index)
        end

        losing_board.add_turn(opposing_player, 2)
        losing_turn = GameTurn.new(losing_board, player, 5, 3)
        losing_turn.take!
        expect(losing_turn).to_not be_winner
      end

      it 'is a win if a row of 4 of the same player is found in the middle of the row' do
        winning_board.add_turn(player, 2)
        winning_board.add_turn(player, 4)
        winning_board.add_turn(player, 5)

        winning_turn = GameTurn.new(winning_board, player, 5, 3)
        winning_turn.take!
        expect(winning_turn).to be_winner
      end
      end

    describe "#vertical_win?" do
      it 'is a win if a player has 4 in a line in the column' do
        3.times do
          winning_board.add_turn(player, 3)
        end

        winning_turn = GameTurn.new(winning_board, player, 2, 3)
        winning_turn.take!
        expect(winning_turn).to be_winner
      end

      it 'is not a win if a line is interrupted by another player' do
        2.times do
          losing_board.add_turn(player, 3)
        end

        losing_board.add_turn(opposing_player, 3)
        losing_turn = GameTurn.new(losing_board, player, 2, 3)
        losing_turn.take!
        expect(losing_turn).to_not be_winner
      end

      it 'is a win if a player has 4 in a line in the far left column' do
        3.times do
          winning_board.add_turn(player, 0)
        end

        winning_turn = GameTurn.new(winning_board, player, 2, 0)
        winning_turn.take!
        expect(winning_turn).to be_winner
      end

      it 'is a win if a player has 4 in a line near the top of the column' do
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

    describe "#diagonal_win_right" do
      it 'is a win if a player has 4 in a diagonal line' do
        winning_board.add_turn(player, 0)
        2.times { winning_board.add_turn(player, 1) }
        3.times { winning_board.add_turn(player, 2) }

        winning_turn = GameTurn.new(winning_board, player, 2, 3)
        winning_turn.take!
        expect(winning_turn).to be_winner
      end

      it 'is not a win if a diagonal line is interrupted by another player' do
        losing_board.add_turn(opposing_player, 0)
        2.times { losing_board.add_turn(player, 1) }
        3.times { losing_board.add_turn(player, 2) }

        losing_turn = GameTurn.new(losing_board, player, 2, 3)
        losing_turn.take!
        expect(losing_turn).to_not be_winner
      end

      it 'is a win if a player has 4 in a diagonal line towards the top-right' do
        3.times { winning_board.add_turn(player, 6); winning_board.add_turn(opposing_player, 6) }
        2.times { winning_board.add_turn(opposing_player, 5); winning_board.add_turn(player, 5) }
        winning_board.add_turn(opposing_player, 5)
        2.times { winning_board.add_turn(player, 4); winning_board.add_turn(opposing_player, 4) }

        winning_turn = GameTurn.new(winning_board, opposing_player, 3, 3)
        winning_turn.take!
        expect(winning_turn).to be_winner
      end
    end

    describe "#diagonal_win_left" do
      it 'is a win if a player has 4 in a diagonal line towards the top-left' do
        3.times { winning_board.add_turn(player, 0); winning_board.add_turn(opposing_player, 0) }
        2.times { winning_board.add_turn(opposing_player, 1); winning_board.add_turn(player, 1) }
        winning_board.add_turn(opposing_player, 1)
        2.times { winning_board.add_turn(player, 2); winning_board.add_turn(opposing_player, 2) }

        winning_turn = GameTurn.new(winning_board, opposing_player, 3, 3)
        winning_turn.take!
        expect(winning_turn).to be_winner
      end

      it 'is a win if a player has 4 in a diagonal line towards the bottom-right' do
        winning_board.add_turn(player, 6)
        2.times { winning_board.add_turn(player, 5) }
        3.times { winning_board.add_turn(player, 4) }

        winning_turn = GameTurn.new(winning_board, player, 2, 3)
        winning_turn.take!
        expect(winning_turn).to be_winner
      end
    end
    end
  end
end
