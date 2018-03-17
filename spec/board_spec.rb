require_relative '../lib/tic_tac_toe/board'
require_relative '../lib/tic_tac_toe/core_extensions'
require "spec_helper"

module TicTacToe
  describe Board do
    context "#initialize" do
      it "initializes the board with a grid" do
        expect(TicTacToe::Board.new(grid: "3x3")).to be_an_instance_of(Board)
      end
    end

    context "#grid" do
      it "returns the grid" do
        board = TicTacToe::Board.new(grid: "3x3")
        expect(3).to eq board.grid.length
      end
    end

    context "#get_cell #set_cell" do
      it "updates and returns the cell based on the (x, y) coordinate" do
        board = TicTacToe::Board.new(grid: "3x3")
        board.set_cell(2, 0, "X")
        expect(board.get_cell(2, 0).value).to eq "X"
      end
    end

    context "#game_over" do
      it "returns :winner when row has objects with values that are all the same" do
        board = TicTacToe::Board.new(grid: "3x3")
        board.set_cell(0, 0, "X")
        board.set_cell(0, 1, "X")
        board.set_cell(0, 2, "X")
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when colum has objects with values that are all the same" do
        board = TicTacToe::Board.new(grid: "3x3")
        board.set_cell(0, 0, "X")
        board.set_cell(1, 0, "X")
        board.set_cell(2, 0, "X")
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when diagonal has objects with values that are all the same" do
        board = TicTacToe::Board.new(grid: "3x3")
        board.set_cell(0, 0, "X")
        board.set_cell(1, 1, "X")
        board.set_cell(2, 2, "X")
        expect(board.game_over).to eq :winner
      end

      it "returns :draw when all spaces on the board are taken" do
        board = TicTacToe::Board.new(grid: "3x3")
        board.set_cell(0, 0, "X")
        board.set_cell(0, 1, "Y")
        board.set_cell(0, 2, "X")
        board.set_cell(1, 0, "Y")
        board.set_cell(1, 1, "X")
        board.set_cell(1, 2, "Y")
        board.set_cell(2, 0, "Y")
        board.set_cell(2, 1, "X")
        board.set_cell(2, 2, "Y")
        expect(board.game_over).to eq :draw
      end

      it "returns false when there is no winner or draw" do
        board = TicTacToe::Board.new(grid: "3x3")
        expect(board.game_over).to be false
      end
    end
  end
end
