# - game
# - player
# - board.rb class
# - spot.rb // token.rb class
require_relative '../spec/spec_helper'

puts "Welcome to Connect-4!\n"
board = Board.new

x_player = Player.new('x')
o_player = Player.new('o')

players = [x_player, o_player].shuffle
turn_index = 0
puts board.printer

while board.has_empty_spaces? && !board.winner?
  players_turn = players[turn_index].character

  puts "It is #{players_turn}'s turn.\n"

  column_index = nil
  until board.valid_move?(column_index)
    puts "What column do you want to play?"
    column_index = gets.chomp

    if board.valid_move?(column_index)
      board.add_turn(players_turn, column_index)
    else
      puts "Please enter between 'A' and 'G'."
    end
  end

  puts board.printer

  turn_index = turn_index == 0 ? 1 : 0
end
