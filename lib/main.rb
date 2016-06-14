require_relative '../spec/spec_helper'

puts "Welcome to Connect-4!\n"
board = Board.new

player_x = Player.new('x')
player_o = Player.new('o')

players = [player_x, player_o].shuffle
turn_index = 0
puts board.printer

while board.has_empty_spaces? && !board.winner?
  players_turn = players[turn_index]

  puts "It is #{players_turn.character}'s turn.\n"

  puts "What column do you want to play?"
  column_index = gets.chomp

  until board.valid_move?(column_index)
    puts "Invalid move! Please enter between 'A' and 'G'."
    puts "What column do you want to play?"
    column_index = gets.chomp
  end

  board.add_turn(players_turn, column_index)

  puts board.printer

  turn_index = turn_index == 0 ? 1 : 0
end

if !board.has_empty_spaces?
  puts "It's a draw!"
elsif board.winner?
  puts "#{players_turn.character} wins!"
end
