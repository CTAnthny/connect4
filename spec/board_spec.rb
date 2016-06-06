require 'spec_helper'

describe Board do
  let(:board) { Board.new }

  it 'is initialized with 6 rows and 7 columns' do
    expect(board.board.size).to eq(6)
    expect(board.board[0].size).to eq(7)
  end

  it 'prints an empty board with 6 rows and 7 columns' do
    board_printout =
    "| - | - | - | - | - | - | - |\n" +
    "| - | - | - | - | - | - | - |\n" +
    "| - | - | - | - | - | - | - |\n" +
    "| - | - | - | - | - | - | - |\n" +
    "| - | - | - | - | - | - | - |\n" +
    "| - | - | - | - | - | - | - |\n" +
    "  A   B   C   D   E   F   G "
    expect(board.print).to eq(board_printout)
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
    expect(board.print).to eq(board_printout)
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
    expect(board.print).to eq(board_printout)
  end

  it 'has empty spaces when initialized' do
    expect(board.has_empty_spaces?).to eq(true)
  end

  it 'has no empty spaces when completely occupied' do
    
    expect(board.has_empty_spaces?).to eq(false)
  end
end
