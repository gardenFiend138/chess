module SlidingPiece
  #sliding movements for Queen, Rook, Bishop
  def queen_moves
    rook_moves
    bishop_moves
  end

  def rook_moves
    move_right
    move_left
    move_up
    move_down
  end

  def bishop_moves
    move_down_right
    move_down_left
    move_up_right
    move_up_left
  end

  def move_right
    i = 1
    until false
      x, y = @pos
      y += i
      pos = [x, y]
      break if y > 7 || y < 0 || @board[pos].color == @color
      @moves << pos
      break if @board[pos].color != @color
      i += 1
    end
  end
  # negative horizontal moves
  def move_left
    i = 1
    until false
      x, y = @pos
      y -= i
      pos = [x, y]
      break if y > 7 || y < 0 || @board[pos].color == @color
      @moves << pos
      break if @board[pos].color != @color
      i += 1
    end
  end
  # negative vertical moves
  def move_down
    i = 1
    until false
      x, y = @pos
      x += i
      pos = [x, y]
      break if x > 7 || x < 0 || @board[pos].color == @color
      @moves << pos
      break if @board[pos].color != @color
      i += 1
    end
  end
  # positive vertical moves
  def move_up
    i = 1
    until false
      x, y = @pos
      x -= i
      pos = [x, y]
      break if x > 7 || x < 0 || @board[pos].color == @color
      @moves << pos
      break if @board[pos].color != @color
      i += 1
    end
  end
  # diagonal positive x and y
  def move_down_right
    i = 1
    until false
      x, y = @pos
      x += i
      y += i
      pos = [x, y]
      break if x > 7 || x < 0 || y > 7 || y < 0 || @board[pos].color == @color
      @moves << pos
      break if @board[pos].color != @color
      i += 1
    end
  end
  # diagonal positive x negative y
  def move_down_left
    i = 1
    until false
      x, y = @pos
      x += i
      y -= i
      pos = [x, y]
      break if x > 7 || x < 0 || y > 7 || y < 0 || @board[pos].color == @color
      @moves << pos
      break if @board[pos].color != @color
      i += 1
    end
  end
  # diagonal negative x negative y
  def move_up_left
    i = 1
    until false
      x, y = @pos
      x -= i
      y -= i
      pos = [x, y]
      break if x > 7 || x < 0 || y > 7 || y < 0 || @board[pos].color == @color
      @moves << pos
      break if @board[pos].color != @color
      i += 1
    end
  end
  # diagonal negative x positive y
  def move_up_right
    i = 1
    until false
      x, y = @pos
      x -= i
      y += i
      pos = [x, y]
      break if x > 7 || x < 0 || y > 7 || y < 0 || @board[pos].color == @color
      @moves << pos
      break if @board[pos].color != @color
      i += 1
    end
  end

end




module SteppingPiece
#condition = if x < 7 && x > 0 && y < 7 && y > 0 && @board[pos].color != @color
  #horizontal_moves
  def king_moves
    king_move_horiz
    king_move_vert
    king_move_diag
  end

  def king_move_horiz
    x, y = @pos
    @moves << [x, y + 1] if x < 7 && x > 0 && y + 1 < 7 && y + 1 > 0 && @board[pos].color != @color
    @moves << [x, y - 1] if x < 7 && x > 0 && y - 1 < 7 && y - 1 > 0 && @board[pos].color != @color
  end

  # vertical_moves
  def king_move_vert
    x, y = @pos
    @moves << [x + 1, y] if x + 1 < 7 && x - 1 > 0 && y < 7 && y > 0 && @board[pos].color != @color
    @moves << [x - 1, y] if x - 1 < 7 && x - 1 > 0 && y < 7 && y > 0 && @board[pos].color != @color
  end

  def king_move_diag
    x, y = @pos
    @moves << [x + 1, y + 1] if x + 1 < 7 && x + 1 > 0 && y + 1 < 7 && y + 1 > 0 && @board[pos].color != @color
    @moves << [x + 1, y - 1] if x + 1 < 7 && x + 1 > 0 && y - 1 < 7 && y - 1 > 0 && @board[pos].color != @color
    @moves << [x - 1, y - 1] if x - 1 < 7 && x - 1 > 0 && y - 1 < 7 && y - 1 > 0 && @board[pos].color != @color
    @moves << [x - 1, y + 1] if x - 1 < 7 && x - 1 > 0 && y + 1 < 7 && y + 1 > 0 && @board[pos].color != @color
  end

  def knight_moves
    knight_moves_up_left
    knight_moves_up_right
    knight_moves_down_right
    knight_moves_down_left
  end

  def knight_moves_up_left
    x, y = @pos
    @moves << [x - 1, y - 2] if x - 1 < 7 && x - 1 > 0 && y - 2 < 7 && y - 2 > 0 && @board[pos].color != @color
    @moves << [x - 2, y - 1] if x + 2 < 7 && x + 2 > 0 && y - 1 < 7 && y - 1 > 0 && @board[pos].color != @color
  end

  def knight_moves_up_right
    x, y = @pos
    @moves << [x - 2, y + 1] if x - 2 < 7 && x - 2 > 0 && y + 1< 7 && y + 1 > 0 && @board[pos].color != @color
    @moves << [x - 1, y + 2] if x - 1 < 7 && x - 1 > 0 && y + 2 < 7 && y + 2 > 0 && @board[pos].color != @color
  end

  def knight_moves_down_left
    x, y = @pos
    @moves << [x + 2, y - 1] if x + 2 < 7 && x + 2 > 0 && y - 1 < 7 && y - 1 > 0 && @board[pos].color != @color
    @moves << [x + 1, y - 2] if x + 1 < 7 && x + 1 > 0 && y - 2 < 7 && y - 2 > 0 && @board[pos].color != @color
  end

  def knight_moves_down_right
    x, y = @pos
    @moves << [x + 1, y + 2] if x + 1 < 7 && x + 1 > 0 && y + 2 < 7 && y + 2 > 0 && @board[pos].color != @color
    @moves << [x + 2, y + 1] if x + 2 < 7 && x + 2 > 0 && y + 1 < 7 && y + 1 > 0 && @board[pos].color != @color
  end

end

module PawnPiece
  def pawn_moves
    pawn_move_up
    pawn_take_diag
  end

  def pawn_move_up
    x, y = @pos
    if x == 1 || x == 6
      @moves << [x - 2, y] if x - 2 > 0 && @board[pos].color == nil && @color == :white
      @moves << [x + 2, y] if x - 2 > 0 && @board[pos].color == nil && @color == :black
    end

    @moves << [x - 1, y] if x - 1 > 0 && @board[pos].color == nil && @color == :white
    @moves << [x + 1, y] if x - 1 > 0 && @board[pos].color == nil && @color == :black
  end

  def pawn_take_diag
    x, y = @pos
    @moves << [x - 1, y + 1] if x - 1 > 0 && y + 1 < 7 && @board[pos].color != @color && @board[pos].color != nil && @color == :white
    @moves << [x - 1, y - 1] if x - 1 > 0 && y - 1 < 0 && @board[pos].color != @color && @board[pos].color != nil && @color == :white
    @moves << [x + 1, y + 1] if x + 1 < 7 && y + 1 < 7 && @board[pos].color != @color && @board[pos].color != nil && @color == :black
    @moves << [x + 1, y - 1] if x + 1 < 7 && y - 1 < 0 && @board[pos].color != @color && @board[pos].color != nil && @color == :black
  end

end
