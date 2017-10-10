require_relative 'cursor.rb'
require_relative 'board.rb'
require 'colorize'
class Display

   def initialize(board)
     @cursor = Cursor.new([0, 0], @board = board)
   end

   def render
     @board.render
     @cursor.cursor_pos = @cursor.get_input
     @board.render
     @board[@cursor.cursor_pos].value.colorize(:light_blue ).colorize( :background => :red)
   end

end

if __FILE__ == $0
  board = Board.new
  display = Display.new(board)
  display.render
end
