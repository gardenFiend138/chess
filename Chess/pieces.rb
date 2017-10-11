require_relative 'board.rb'
require_relative 'piece_movement_modules.rb'
class Piece

  def initialize(board)
    @piece = :pawn
    @pos = nil
    @value = " "
    @moves = []
    @board = board
    @color = nil
  end

  def color
    @color
  end

  def color=(new_color)
    @color = new_color
  end

  def pos
    @pos
  end

  def pos=(new_pos)
    @pos = new_pos
  end

  def value
    @value
  end

  def value=(value)
    @value = value
  end 

  def moves
    @moves
  end

  def valid_move?(pos)
    @moves.include?(pos)
  end

end


class NullPiece < Piece
  # include Singleton
  def initialize(board)
    super
    @piece = :null
    @value = " "
  end

end

class Bishop < Piece
  include SlidingPiece
  def initialize(board)
    super
    @value = "B"
  end

  def move_dirs
    bishop_moves
  end
end

class Rook < Piece
  include SlidingPiece

  def initialize(board)
    super
    @value = "R"
  end

  def move_dirs
    rook_moves
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(board)
    super
    @value = "Q"
  end

  def move_dirs
    queen_moves
  end
end

class King < Piece
  include SteppingPiece

  def initialize(board)
    super
    @value = "K"
  end

  def move_dirs
    king_moves
  end
end

class Knight < Piece
  include SteppingPiece

  def initialize(board)
    super
    @value = "H"
  end

  def move_dirs
    knight_moves
  end
end

class Pawn < Piece
  include PawnPiece

  def initialize(board)
    super
    @value = "P"
  end

  def move_dirs
    pawn_moves
  end

end

if __FILE__ == $0
  board = Board.new
  pawn = Pawn.new(board)
  pawn.move_dirs
  pawn.moves
end
