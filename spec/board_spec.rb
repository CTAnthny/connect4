require 'spec_helper'

describe Board do
  let(:board) { Board.new }
  let(:player_x) { Player.new('x') }
  let(:player_o) { Player.new('o') }

  describe "#initialize" do
    it 'is initialized with 6 rows and 7 columns' do
      expect(board.board.size).to eq(6)
      expect(board.board[0].size).to eq(7)
    end
  end

  describe "#printer" do
    it 'prints an empty board with 6 rows and 7 columns' do
      board_printout =
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | - | - | - | - |\n" +
      "  A   B   C   D   E   F   G "
      expect(board.printer).to eq(board_printout)
    end

    it 'places a players token on the board' do
      board.add_turn(player_x, 'A')
      board_printout =
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | - | - | - | - |\n" +
      "| x | - | - | - | - | - | - |\n" +
      "  A   B   C   D   E   F   G "
      expect(board.printer).to eq(board_printout)
    end

    it 'places a players token in the center column on the board' do
      board.add_turn(player_o, 'D')
      board_printout =
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | - | - | - | - |\n" +
      "| - | - | - | o | - | - | - |\n" +
      "  A   B   C   D   E   F   G "
      expect(board.printer).to eq(board_printout)
    end
  end

  describe "#has_empty_spaces?" do
    it 'has empty spaces when initialized' do
      expect(board.has_empty_spaces?).to eq(true)
    end

    it 'has no empty spaces when completely occupied' do
      6.times do |row_index|
        7.times do |col_index|
          board.add_turn(player_x, col_index)
        end
      end
      expect(board.has_empty_spaces?).to eq(false)
    end
  end

  describe "#valid_move?" do
    it 'returns true for a valid column input (as per #add_turn)' do
      expect(board.valid_move?(1)).to eq(true)
      expect(board.valid_move?('a')).to eq(true)
      expect(board.valid_move?('A')).to eq(true)
    end

    it 'returns false for an invalid column input (as per #add_turn)' do
      expect(board.valid_move?(14)).to eq(false)
      expect(board.valid_move?('z')).to eq(false)
    end

    # check valid move when column is full
  end

  # describe "#add_turn" do
  #   context "column is specified with a valid number" do
  #     it "adds a piece to the board"
  #
  #     it "updates the last turn"
  #   end
  #
  #   context "column is specified with a valid letter" do
  #
  #   end
  #
  #   context "column is specified with an invalid number" do
  #
  #   end
  #
  #   context "column is specified with an invalid letter" do
  #
  #   end
  # #   it "does something when someone succesfully adds a piece"
  # #
  # #   it "returns an error when the column is not valid"
  # end
  #
  # describe "#winner"
end

# testing diagram:
# "| o | x | o | - | - | x | o |\n" +
# "| x | o | x | - | x | o | x |\n" +
# "| o | x | o | x | o | x | o |\n" +
# "| x | o | x | o | x | o | x |\n" +
# "| o | x | o | - | o | x | o |\n" +
# "| x | o | x | o | x | o | x |\n" +
# "  A   B   C   D   E   F   G "
