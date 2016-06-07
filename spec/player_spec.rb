require 'spec_helper'

describe Player do

  it 'has a player character' do
    player = Player.new('x')
    expect(player.character).to eq('x')
  end

  it 'has an opposing player character' do
    player = Player.new('o')
    expect(player.character).to eq('o')
  end
end
