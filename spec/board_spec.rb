require 'spec_helper'

describe Board do
  let(:board) { Board.new }

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
      board.add_turn('x', 'A')
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
      board.add_turn('o', 'D')
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
          board.add_turn('x', col_index)
        end
      end
      expect(board.has_empty_spaces?).to eq(false)
    end
  end
  # 
  # describe "#add_turn" do
  #   it "does something when someone succesfully adds a piece"
  #
  #   it "returns an error when the column is not valid"
  # end
  #
  # describe "#winner"
end
