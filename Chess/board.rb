
require_relative 'pieces.rb'
class Board
attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate
  end

  def populate
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        pos = [row_idx, col_idx]
        if row_idx < 2 || row_idx >= 6
          self[pos] = Piece.new
          self[pos].pos = pos
        else
          self[pos] = NullPiece.new
          self[pos].pos = pos
        end

      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise StandardError.new "There is no piece at start pos" if self[start_pos].nil?
    raise StandardError.new "That is not a valid move" if self[start_pos].valid_move?(end_pos)
    self[end_pos].pos, self[start_pos].pos = self[start_pos].pos, self[end_pos].pos
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  # def render
  #   @grid.each_with_index do |row, i|
  #     row.each_with_index do |col, j|
  #       print "| #{col.value} |" if j < @grid.length - 2
  #       puts "| #{col.value} |" if j == @grid.length - 1
  #     end
  #   end
  # end

  def in_bounds(pos)
    x, y = pos
    return false if x > 7 || y > 7 || x < 0 || y < 0
    true
  end
end
