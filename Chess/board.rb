
require_relative 'pieces.rb'
class Board
attr_accessor :grid, :starting_pos, :ending_pos

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @starting_pos = nil
    @ending_pos = nil
    populate
  end

  def populate
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        pos = [row_idx, col_idx]
        if row_idx < 2
          if row_idx == 1
            self[pos] = Pawn.new(self)
            self[pos].color = :white
            self[pos].value = "\u2659"
            self[pos].pos = pos
          elsif row_idx == 0
            if col_idx == 0 || col_idx == 7
              self[pos] = Rook.new(self)
              self[pos].color = :white
              self[pos].value = "\u2656"
              self[pos].pos = pos
            elsif col_idx == 1 || col_idx == 6
              self[pos] = Knight.new(self)
              self[pos].color = :white
              self[pos].value = "\u2658"
              self[pos].pos = pos
            elsif col_idx == 2 || col_idx == 5
              self[pos] = Bishop.new(self)
              self[pos].color = :white
              self[pos].value = "\u2657"
              self[pos].pos = pos
            elsif col_idx == 3
              self[pos] = Queen.new(self)
              self[pos].color = :white
              self[pos].value = "\u2655"
              self[pos].pos = pos
            elsif col_idx == 4
              self[pos] = King.new(self)
              self[pos].color = :white
              self[pos].value = "\u2654"
              self[pos].pos = pos
            end
          end

        elsif row_idx >= 6
          if row_idx == 6
            self[pos] = Pawn.new(self)
            self[pos].color = :black
            self[pos].value = "\u265F"
            self[pos].pos = pos
          elsif row_idx == 7
            if col_idx == 0 || col_idx == 7
              self[pos] = Rook.new(self)
              self[pos].color = :black
              self[pos].value = "\u265C"
              self[pos].pos = pos
            elsif col_idx == 1 || col_idx == 6
              self[pos] = Knight.new(self)
              self[pos].color = :black
              self[pos].value = "\u265E"
              self[pos].pos = pos
            elsif col_idx == 2 || col_idx == 5
              self[pos] = Bishop.new(self)
              self[pos].color = :black
              self[pos].value = "\u265D"
              self[pos].pos = pos
            elsif col_idx == 4
              self[pos] = Queen.new(self)
              self[pos].color = :black
              self[pos].pos = pos
              self[pos].value = "\u265B"
            elsif col_idx == 3
              self[pos] = King.new(self)
              self[pos].color = :black
              self[pos].value = "\u265A"
              self[pos].pos = pos
            end
          end
        else
          self[pos] = NullPiece.new(self)
          self[pos].pos = pos
        end

      end
    end
  end

  def move_piece(start_pos = nil, end_pos = nil)
    start_pos = @starting_pos
    end_pos = @ending_pos
    # raise StandardError.new "There is no piece at start pos" if self[start_pos].nil?
    # raise StandardError.new "That is not a valid move" if self[start_pos].valid_move?(end_pos)
    # self[end_pos].pos, self[start_pos].pos = self[start_pos].pos, self[end_pos].pos
    temp_pos = end_pos
    self[end_pos] = self[start_pos]
    self[start_pos].pos = end_pos
    self[start_pos] = NullPiece.new(@board)
    @starting_pos = nil
    @ending_pos = nil
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def in_bounds(pos)
    x, y = pos
    return false if x > 7 || y > 7 || x < 0 || y < 0
    true
  end
end
