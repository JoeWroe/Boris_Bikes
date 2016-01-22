require_relative 'Bike'

class DockingStation

attr_reader :bikes, :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike   # Doing 2 things
    if @bikes.empty?   # => Defining the capacity
      raise Exception.new("No Bikes Available")
    else
      @bikes.pop    # => Removing a bike
    end
  end

  def dock(potato)   # Doing 2 things
    if full? == true
      raise Exception.new("Docking Station Full")
    else
       @bikes << potato
    end
  end

  private

  def full?
    @bikes.size >= DEFAULT_CAPACITY ? true : false   # => Defining the capacity
  end

end
