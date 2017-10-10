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

  def valid_move?(pos)
    self.moves.include?(pos)
  end

end


class NullPiece < Piece

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

  def move_dirs(start_pos = self.pos)
  end
end

class Rook < Piece
  include SlidingPiece

  def initialize(board)
    super
    @value = "R"
  end

  def move_dirs
    :horizontal
    :vertical
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(board)
    super
    @value = "Q"
  end

  def move_dirs
    :diagonal
    :horizontal
    :vertical
  end
end

module SteppingPiece
  def moves

  end
end

class King < Piece
  include SteppingPiece

  def initialize(board)
    super
    @value = "K"
  end

  def move_dirs
  end
end

class Knight < Piece
  include SteppingPiece

  def initialize(board)
    super
    @value = "H"
  end

  def move_dirs
  end
end

class Pawn < Piece
  def initialize(board)
    super
    @value = "P"
  end

end
