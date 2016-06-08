require_relative '../spec/spec_helper'

class BoardSpace
  attr_accessor :player

  def occupied?
    !@player.nil?
  end

  def token
    if @player
      @player.character
    else
      '-'
    end
  end
end
