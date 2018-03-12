module TicTacToe
  class Game
    attr_reader :players, :board, :current_player, :other_player

    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @mapping = set_mapping(@board.grid)
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def solicit_move
      puts "#{current_player.name}: Enter a number between 1 and 9 to make your move"
      if current_player.ai == true
        human_move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
      else
        human_move = gets.chomp![0]
      end
      while !verify_input_contains_only_integers(human_move)
       puts "I'm sorry, you must pick a number between 1 and 9. Please try again."
        human_move = gets.chomp![0]
      end
      return human_move
    end

    def get_move(human_move)
      human_move_to_coordinate(human_move)
    end

    def valid_move?(x,y)
      board.get_cell(x,y).value.empty?
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "The game ended in a tie" if board.game_over == :draw
    end

    def play
      puts "#{current_player.name} has randomly been selected as the first player"
      while true
        board.formatted_grid
        human_move = solicit_move
        x, y = get_move(human_move)
        move_valid = valid_move?(x,y)
        unless move_valid
          begin
            puts "ERROR: NOT A VALID MOVE\n"
            human_move = solicit_move
            x, y = get_move(human_move)
            move_valid = valid_move?(x,y)
          end while move_valid != true
        end
        board.set_cell(x, y, current_player.token)

        if board.game_over
          puts game_over_message
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

    def set_mapping(grid)
      # TODO set mapping based on grid size
      # mapping = {}
      # mapping_array = []
      # cnt = 0
      # grid.each_with_index do |row, index|
      #   row.map.with_index(1) do |cell, index|
      #     r = {
      #       index.to_s => [cnt, index]
      #     }
      #    mapping_array << r
      #     cnt += 1
      #   end
      # end


      # return mapping
    end

    def human_move_to_coordinate(human_move)
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
      mapping[human_move]
    end

  end
end
