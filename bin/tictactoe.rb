#!/usr/bin/env ruby
root = File.expand_path("../", File.dirname(__FILE__))
require 'pry'
require "#{root}/lib/tic_tac_toe.rb"
require_relative('../data/computer_players')
require_relative('../helpers/input_helpers')

answer = "y"

while answer == "y"
  puts "Let's Play Tic Tac Toe!!"

  p
  puts "First I need to know how many players? (1/2?) . . . \n"
  number_of_players = gets.chomp!

  if verify_input_contains_only_integers(number_of_players)
    number_of_players = number_of_players.to_i
  end


  if number_of_players > 1
    puts "Ok, we got #{number_of_players} players! \n\n"
    puts "What's player 1's name?"
    player_1 = gets.chomp!
    puts "#{player_1}, choose a token (X or O)"
    player_1_token = gets.chomp!.upcase

    player_1 = TicTacToe::Player.new({token: player_1_token, name: player_1})
    puts "What's player 2's name?"
    player_2 = gets.chomp!

    if player_1_token == "X"
      player_2_token = "O"
    else
      player_2_token = "X"
      player_1_token = "O"
    end
    player_2 = TicTacToe::Player.new({token: player_2_token, name: player_2})
    puts "\n\n"
    puts "Ok, #{player_1.name} token: #{player_1.token} vs #{player_2.name} token: #{player_2.token} \n\n"
  else
    puts "What's your name?"
    player_1 = gets.chomp!
    puts "#{player_1}, choose a token (X or O)"
    player_1_token = gets.chomp!.upcase
    if player_1_token == "X"
      player_2_token = "O"
    else
      player_2_token = "X"
      player_1_token = "O"
    end

    player_1 = TicTacToe::Player.new({token: player_1_token, name: player_1})
    player_2 = COMPUTER_PLAYERS.sample[:name]
    player_2 = TicTacToe::Player.new({token: player_2_token, name: player_2, ai: true})
    puts "Ok #{player_1.name} token: #{player_1.token}, You will play against #{player_2.name} token: #{player_2.token} \n\n"
  end

  puts "Now, what size board would you like? (press enter for default 3x3) . . .\n"
  grid = gets.chomp!


  puts "Ok, #{player_1.name} vs #{player_2.name} on a #{grid} board.\n\n"

  puts "Excellent! Let's see who goes first . . . \n\n"




  players = [player_1, player_2]
  if grid.empty?
    grid = "3x3"
  end
  answer = TicTacToe::Game.new(players, TicTacToe::Board.new(grid: grid)).play
  puts "Thanks for playing!"
end
