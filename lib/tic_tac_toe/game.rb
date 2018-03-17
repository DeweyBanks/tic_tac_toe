module TicTacToe
  class Game
    attr_reader :players, :board, :current_player, :other_player

    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def get_move_option
      puts "#{current_player.name}: Enter a number between 1 and 9 to make your move"
      if current_player.ai
        move_option = get_ai_move
      else
        move_option = gets.chomp![0]
      end
      while !verify_input_contains_only_integers(move_option)
       puts "I'm sorry, you must pick a number between 1 and 9. Please try again."
        move_option = gets.chomp![0]
      end
      return move_option
    end

    def valid_move?(x,y)
      board.get_cell(x,y).value.empty?
    end

    def game_over
      return print_winner_message if board.game_over == :winner
      return print_tie_message if board.game_over == :draw
    end

    def get_ai_move
      sleep 2
      possible_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      ai_move_option = possible_moves.sample
      move = set_move(ai_move_option)
      unless move[:valid]
        begin
          ai_move_option = possible_moves.sample
          move = set_move(ai_move_option)
          possible_moves.delete(ai_move_option)
        end while move[:valid] != true
      end
     return ai_move_option
    end

    def set_move(move_option)
      x, y = move_to_coordinate(move_option)
      return {
        valid: valid_move?(x, y),
        x: x,
        y: y
      }
    end

    def play
      sleep 2
      puts "#{current_player.name} has randomly been selected as the first player"
      while true
        board.formatted_grid
        move_option = get_move_option
        move = set_move(move_option)
        unless move[:valid]
          begin
            puts "ERROR: MOVE TAKEN. Please choose again\n"
            move_option = get_move_option
            move = set_move(move_option)
          end while move[:valid] != true
        end
        board.set_cell(move[:x], move[:y], current_player.token)
        if board.game_over
          clear_display
          game_over
          board.formatted_grid
          puts "\n Would you like to play again? (y/n)"
          answer = gets.chomp![0].downcase
          return answer
        else
          switch_players
        end
      end
    end

    private

    def move_to_coordinate(move_option)
      mapping = {
        "1" => [0, 0],
        "2" => [1, 0],
        "3" => [2, 0],
        "4" => [0, 1],
        "5" => [1, 1],
        "6" => [2, 1],
        "7" => [0, 2],
        "8" => [1, 2],
        "9" => [2, 2]
      }
      mapping[move_option]
    end

  end
end
