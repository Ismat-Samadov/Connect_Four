# connect_four.rb

class ConnectFour
  attr_reader :board

  def initialize
    @board = Array.new(6) { Array.new(7, ' ') }
  end

  def drop_piece(column, piece)
  puts "Column parameter type: #{column.class}"
  row = find_empty_row(column)
  return false unless row

  @board[row][column] = piece
  true
  end


  def check_win(piece)
    return true if horizontal_win?(piece)
    return true if vertical_win?(piece)
    return true if diagonal_win?(piece)

    false
  end

  private

  def find_empty_row(column)
    @board.reverse_each do |row|
      return row if row[column] == ' '
    end
    nil
  end

  def horizontal_win?(piece)
    @board.each do |row|
      (0..3).each do |i|
        return true if row[i..i + 3].all? { |cell| cell == piece }
      end
    end
    false
  end

  def vertical_win?(piece)
    (0..6).each do |column|
      (0..2).each do |i|
        return true if @board[i][column] == piece && @board[i + 1][column] == piece &&
                        @board[i + 2][column] == piece && @board[i + 3][column] == piece
      end
    end
    false
  end

  def diagonal_win?(piece)
    # Implement diagonal win check here
    false
  end
end
