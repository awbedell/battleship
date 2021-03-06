class Ship
  attr_reader :length, :locations

  def initialize(length)
    @length = length
    @placed = false
    @locations = []
  end

  def place(x, y, horizontal)
    if @placed == false
      @length.times { |spot| @locations << (horizontal ? [x + spot, y] : [x, y + spot]) }
      @placed = true
    end
  end

  def covers?(x, y)
    @locations.include?([x, y])
  end

  def overlaps_with?(ship)
    !(@locations & ship.locations).empty?
  end

  def fire_at(x, y)
    @locations.delete([x, y]) if covers?(x, y)
  end

  def sunk?
    @placed == true && @locations.empty?
  end
end
