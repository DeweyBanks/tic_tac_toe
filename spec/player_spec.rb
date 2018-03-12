require "spec_helper"

module TicTacToe
  describe Player do
    context "#initialize" do
      it "does not raise an error when initialized with a valid input hash" do
        input = { token: "X", name: "Someone" }
        expect { Player.new(input) }.to_not raise_error
      end
    end

    context "#token" do
      it "returns the token" do
        input = { token: "X", name: "Someone" }
        player = Player.new(input)
        expect(player.token).to eq "X"
      end
    end

    context "#name" do
      it "returns the player's name" do
        input = { token: "X", name: "Someone" }
        player = Player.new(input)
        expect(player.name).to eq "Someone"
      end
    end
  end
end
