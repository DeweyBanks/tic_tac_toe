module TicTacToe
  class Player
    attr_reader :token, :name, :ai

    def initialize(input)
      @token = input.fetch(:token, "")
      @name = input.fetch(:name, "anonymous")
      @ai = input.fetch(:ai, false)
    end

  end
end
