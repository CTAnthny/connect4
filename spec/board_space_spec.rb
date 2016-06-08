require 'spec_helper'

describe BoardSpace do
  let(:space) { BoardSpace.new }

  it 'is occupied if a player has played there' do
    space.player = Player.new('x')
    # expect(space.occupied?).to be(true)
    expect(space).to be_occupied
  end

  it 'is not occupied if a player has not played there' do
    # expect(space.occupied?).to be(false)
    expect(space).to_not be_occupied
  end

  it 'has a player if one is assigned to it' do
    player = Player.new('x')
    space.player = player
    expect(space.player).to eq(player)
  end
end
