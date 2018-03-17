require_relative "./tic_tac_toe/board.rb"
require_relative "./tic_tac_toe/cell.rb"
require_relative "./tic_tac_toe/game.rb"
require_relative "./tic_tac_toe/player.rb"
require_relative "./tic_tac_toe/core_extensions.rb"
require_relative('./tic_tac_toe/helpers/input_helper')
require_relative('./tic_tac_toe/helpers/printable')
include TicTacToe::InputHelper
include TicTacToe::Printable

module TicTacToe
end
