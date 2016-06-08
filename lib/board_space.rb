class BoardSpace
  attr_accessor :player

  def occupied?
    !@player.nil?
  end
end
