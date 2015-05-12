require './grid.rb'
require './player.rb'
require './ship.rb'

def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  attr_accessor :name
  def initialize(name = "Dave")
    @name = name
<<<<<<< HEAD
=======
    @grid = Grid.new
    @ships = []
    @shots = []
>>>>>>> ed573aec87b56ab66b5d96810638c433e8397e62
  end

  def place_ships(lengths_to_place)
    lengths_to_place.each do |length|
      placed = false
      until placed do
        new_ship = Ship.new(length)
        puts "#{@name}, where would you like to place a ship of length #{length}?"
        coordinate = get_user_input
        puts "Across or Down?"
        orientation = get_user_input
        horizontal = (orientation == "Across")
        p coordinate
        new_ship.place(@grid.x_of(coordinate), @grid.y_of(coordinate), horizontal)

        if new_ship.location.any? {|l| @grid.has_ship_on?(l[0], l[1])}
          puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
        else
          @grid.place_ship(new_ship, @grid.x_of(coordinate), @grid.y_of(coordinate), horizontal)
          @ships << new_ship
          placed = true
        end
      end
    end
  end

def call_shot
  puts "#{@name}, please enter the coordinates for your next shot (e.g. 'B10'):"
  shot = get_user_input
  @shots << shot
end

def display_shots_grid
  puts %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------}
  letter = ('A'..'J').to_a
  (1..10).each do |row|
    draw_row = "#{letter[row-1]} "
      (1..10).each do |column|
        if @shots.include?([column, row])
          draw_row += "| O "
        else
          draw_row += "|   "
        end
      end
      draw_row += "|"
      puts draw_row
  end
  puts "  -----------------------------------------"
end


end
