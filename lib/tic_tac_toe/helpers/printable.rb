module TicTacToe
  module Printable

    def print_greeting
      puts "Let's Play Tic Tac Toe!!\n\n"
      puts "Player Setup::::: "
      puts "******************************************\n\n"
      puts "Hello! What's your name?\n\n"
    end

    def print_game_grid_options
      puts "Here is the game board\n"
      puts "Each cell is represented by a number."
      puts "You will enter that number to place your token in that cell\n\n\n"
      puts "1 | 2 | 3 "
      puts "----------"
      puts "4 | 5 | 6 "
      puts "----------"
      puts "7 | 8 | 9 "
    end

    def print_grid_reminder
      puts "1 | 2 | 3 "
      puts "----------"
      puts "4 | 5 | 6 "
      puts "----------"
      puts "7 | 8 | 9 "
      puts "\n\n"
    end

    def print_players_announcement(players)
      puts "Ok, #{players.first.name} token: #{players.first.token} vs #{players.last.name} token: #{players.last.token} \n\n"
    end

    def clear_display
      `reset`
    end

    def print_winner_message
      puts "#{current_player.name} " + WINNER_GREETS.sample
      puts "#{other_player.name} " + LOSER_GREETS.sample
    end

     def print_tie_message
      puts "The Game has ended in a tie . . ."
      sleep 2
      puts "this has all been a waste of time"
    end

  end
end
