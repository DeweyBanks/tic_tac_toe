module TicTacToe
  module GameDirection

    def ai_game(player_name)
      ai_name = COMPUTER_PLAYERS.sample[:name]
      puts "Nice!! my name is #{ai_name}.\n\n"
      puts "#{player_name}, are you player 1('X') or player 2('O')? (1/2)\n\n"
      player_number = gets.chomp!
      if player_number == "X" || player_number == "1"
       player_1 = player_setup({name: player_name, token: "X"})
       player_2 = player_setup({name: ai_name, token: "O", ai: true})
      else
        player_1 = player_setup({name: ai_name, token: "X", ai: true})
        player_2 = player_setup({name: player_name, token: "O"})
      end
      players = [player_1, player_2]
    end

    def human_game(player_name)
      puts "Oh . . .you have a friend . . . what's their name?\n\n"
      other_human_name = gets.chomp!
      puts "so #{player_name} vs #{other_human_name}."
      puts "#{player_name}, are you player 1('X') or player 2('O')? (1/2)\n\n"
      player_number = gets.chomp!
       if player_number == "X" || player_number == "1"
       player_1 = player_setup({name: player_name, token: "X"})
       player_2 = player_setup({name: other_human_name, token: "O"})
      else
        player_1 = player_setup({name: other_human_name, token: "X"})
        player_2 = player_setup({name: player_name, token: "O"})
      end
      players = [player_1, player_2]
    end

    protected

      def player_setup(options)
        TicTacToe::Player.new(options)
      end

  end
end
