Dir[File.join(File.dirname(__FILE__), 'tic_tac_toe', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'tic_tac_toe/helpers', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), '../data', '*.rb')].each {|file| require file }

include TicTacToe::InputHelper
include TicTacToe::Printable
include TicTacToe::GameDirection

 answer = "y"

while answer == "y"
  clear_display
  print_greeting
  player_name = gets.chomp!

  puts "Would you like to play against me? (y/n)\n\n"
  am_i_playing = gets.chomp![0].downcase
  clear_display
  if am_i_playing == "y"
    players = ai_game(player_name)
  else
    players = human_game(player_name)
  end
  clear_display
  print_players_announcement(players)
  print_game_grid_options

  puts "\nhit enter to continue"
  gets.chomp

  puts "Excellent! Let's see who goes first . . . \n\n"
  sleep 1.0

  answer = TicTacToe::Game.new(players, TicTacToe::Board.new(grid: "3x3")).play
  puts "Thanks for playing!"
end
