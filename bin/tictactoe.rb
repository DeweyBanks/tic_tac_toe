#!/usr/bin/env ruby
root = File.expand_path("../", File.dirname(__FILE__))
require 'pry'
require "#{root}/lib/tic_tac_toe.rb"
require_relative('../data/computer_players')
require_relative('../helpers/input_helpers')


def player_setup(options)
  TicTacToe::Player.new(options)
end


answer = "y"

while answer == "y"
  puts "Let's Play Tic Tac Toe!!\n\n"

  puts "Player Setup::::: "
  puts "******************************************\n\n"
  puts "Hello! What's your name?\n\n"
  player_name = gets.chomp!

  puts "Would you like to play against me? (y/n)\n\n"
  am_i_playing = gets.chomp![0].downcase

  if am_i_playing == "y"
    ai_name = COMPUTER_PLAYERS.sample[:name]
    puts "Nice!! my name is #{ai_name}.\n\n"
    puts "Are you player 1('X') or player 2('O')? (1/2)\n\n"
    player_number = gets.chomp!
    if player_number == "X" || player_number == "1"
     player_1 = player_setup({name: player_name, token: "X"})
     player_2 = player_setup({name: ai_name, token: "O", ai: true})
    else
      player_1 = player_setup({name: ai_name, token: "X", ai: true})
      player_2 = player_setup({name: player_name, token: "O"})
    end
  else
    puts "Oh . . .you have a friend . . . what's their name?\n\n"
    other_human_name = gets.chomp!
    puts "so #{player_name} vs #{other_human_name}."
    puts "Are you player 1('X') or player 2('O')? (1/2)\n\n"
    player_number = gets.chomp!
     if player_number == "X" || player_number == "1"
     player_1 = player_setup({name: player_name, token: "X"})
     player_2 = player_setup({name: other_human_name, token: "O"})
    else
      player_1 = player_setup({name: other_human_name, token: "X"})
      player_2 = player_setup({name: player_name, token: "O"})
    end
  end


  puts "Ok, #{player_1.name} token: #{player_1.token} vs #{player_2.name} token: #{player_2.token} \n\n"


  # puts "Now, what size board would you like? (press enter for default 3x3) . . .\n"
  # grid = gets.chomp!


  # puts "Ok, #{player_1.name} vs #{player_2.name} on a #{grid} board.\n\n"

  puts "Excellent! Let's see who goes first . . . \n\n"

  players = [player_1, player_2]


  answer = TicTacToe::Game.new(players, TicTacToe::Board.new(grid: "3x3")).play
  puts "Thanks for playing!"
end
