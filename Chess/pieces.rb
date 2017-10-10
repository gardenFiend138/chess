class Piece
  attr_reader :value
  attr_accessor :pos

  def initialize
    @piece = :pawn
    @pos = nil
    @value = "p"
  end

  def valid_move?(pos)
    false
  end

end


class NullPiece < Piece

  def initialize
    @piece = :null
    @pos = nil
    @value = " "
  end

end
