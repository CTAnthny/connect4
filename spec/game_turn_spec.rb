require_relative 'spec_helper.rb'

describe GameTurn do
  let(:board) { Board.new }
  let(:player) { Player.new('x') }
  let(:col_index) { 0 }
  let(:turn) { GameTurn.new(board, player, col_index) }

  it 'has a board' do
    expect(turn.board).to eq(board)
  end

  it 'has a player' do
    expect(turn.player).to eq(player)
  end

  it 'has a column index' do
    expect(turn.col_index).to eq(col_index)
  end

  context 'checking for win conditions' do
    context 'horizontal' do
      it 'does have a win if a row of 4 of the same player is found' do
        winning_board = Board.new
      end
      it 'does not have a win if a row of 4 is interrupted by another player' do
        losing_board = Board.new
      end

    end

    context 'vertical' do
      it 'is a win if a player has 4 in a line in the column'
      it 'is not a win if a line is interrupted by another player'
    end

    context 'diagonal' do
      it 'is a win if a player has 4 in a diagonal line'
      it 'is not a win if a diagonal line is interrupted by another player'
    end
  end
end
