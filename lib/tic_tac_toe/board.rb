module TicTacToe
  class Board
    attr_reader :grid

    def initialize(input = {})
      @grid = calculate_grid(input[:grid])
    end

    def get_cell(x, y)
      grid[y][x]
    end

    def set_cell(x, y, value)
      get_cell(x, y).value = value
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    def formatted_grid
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
      end
      puts "\n\n"
    end

    private

    def calculate_grid(input)
      #force grid to be 3x3 for now
      input = "3x3"
      #split the grid on the x into an array
      grid_size_array = input.split("x")
      #create a new array turning the strings into integers
      integer_array = grid_size_array.map {|x| x.to_i}
      #use the integers to create the grid
      Array.new(integer_array[0]) { Array.new(integer_array[1]) { Cell.new } }
    end

    def draw?
      # get an array of cell values and check if any are not set.
      # return true if each cell has a value
      grid.flatten.map { |cell| cell.value }.none_empty?
    end

    def winner?
      # winning_positions collects the grid values, the column values, and the diagnal values

      winning_positions.each do |winning_position|
        # skip to the next one if each cell is empty
        next if winning_position_values(winning_position).all_empty?
        # return true if each cell has a matching value
        return true if winning_position_values(winning_position).all_same?
      end
      # return false if no winning position was found
      false
    end

    def winning_position_values(winning_position)
      # return an array containing each cell's value
      winning_position.map { |cell| cell.value }
    end

    def winning_positions
      # return an array of each possible winning combination
      # currently hard coded for a grid of 3x3
      # you can win by hitting 3 rows, 3 columns, or on a diagonal
      grid + grid.transpose + diagonals
    end

    def diagonals
      # hard coded for 3x3 for now
      [
        [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
        [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
      ]
    end

  end
end
