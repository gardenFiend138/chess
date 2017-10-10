require_relative 'cursor.rb'
require_relative 'board.rb'
require 'colorize'
class Display

   def initialize(board)
     @cursor = Cursor.new([0, 0], @board = board)
   end

   def render
     system("clear")
     @board.grid.each_with_index do |row, i|
       row.each_with_index do |col, j|
         pos = col.value
         if [i, j] == @cursor.cursor_pos
           pos = @board[@cursor.cursor_pos].value.colorize(:light_blue ).colorize( :background => :red)
         end
         print "| #{pos} |"

       end
       puts " "
     end

    @cursor.cursor_pos = @cursor.get_input

  end
end

if __FILE__ == $0
  board = Board.new
  display = Display.new(board)
  display.render until false
end
