# spec/connect_four_spec.rb

require_relative '../connect_four'

describe ConnectFour do
  describe "#initialize" do
    it "initializes a 7x6 game board" do
      game = ConnectFour.new
      expect(game.board).to eq([
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ']
      ])
    end
  end

  describe "#drop_piece" do
    context "when dropping a piece into an empty column" do
      it "drops the piece to the bottom of the column" do
        game = ConnectFour.new
        game.drop_piece(1, 'X')
        expect(game.board[5][1]).to eq('X')
      end
    end

    context "when dropping a piece into a column with existing pieces" do
      it "drops the piece on top of the existing pieces" do
        game = ConnectFour.new
        game.drop_piece(1, 'X')
        game.drop_piece(1, 'O')
        expect(game.board[4][1]).to eq('O')
      end
    end

    context "when dropping a piece into a full column" do
      it "does not change the board" do
        game = ConnectFour.new
        6.times { game.drop_piece(1, 'X') }
        game.drop_piece(1, 'O')
        expect(game.board[0][1]).to eq('X')
      end
    end
  end

  describe "#check_win" do
    context "when there is a horizontal win" do
      it "returns true" do
        game = ConnectFour.new
        (0..3).each { |row| game.drop_piece(row, 'X') }
        expect(game.check_win('X')).to be true
      end
    end

    # Add more tests for other win conditions...

    context "when there is no win" do
      it "returns false" do
        game = ConnectFour.new
        expect(game.check_win('X')).to be false
      end
    end
  end

end
