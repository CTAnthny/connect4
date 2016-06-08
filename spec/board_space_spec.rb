require 'spec_helper'

describe BoardSpace do
  let(:space) { BoardSpace.new }
  let(:player) { Player.new('x') }

  it 'has a player if one is assigned to it' do
    space.player = player
    expect(space.player).to eq(player)
  end

  describe "#occupied?" do
    it 'is occupied if a player has played there' do
      space.player = player
      # expect(space.occupied?).to be(true)
      expect(space).to be_occupied
    end

    it 'is not occupied if a player has not played there' do
      # expect(space.occupied?).to be(false)
      expect(space).to_not be_occupied
    end
  end

  describe "#token" do
    it 'represents the player occupying it as a string' do
      space.player = player
      expect(space.token).to eq('x')
    end

    it 'represents an empty space as a string if it is empty' do
      expect(space.token).to eq('-')
    end
  end
end
