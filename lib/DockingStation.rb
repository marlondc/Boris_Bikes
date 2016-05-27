require_relative 'Bike'

class DockingStation


  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20


  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @storage = []
    @capacity = capacity
  end


  def release_bike
    fail "No bikes available" if empty? && @storage.empty?
    fail "No working bikes available" if empty? && !@storage.empty?
    @bikes.pop
  end

  def release_bikes
    temp = @storage
    @storage = []
    temp
  end


  def dock(bike)
    fail "No more spaces for bikes" if full?
    bike.is_a?(Array) ? @bikes.concat(bike) : bike.broken? ? @storage << bike : @bikes << bike
    self
  end

  private

  def full?
    @bikes.count + @storage.count >= capacity ? true : false
  end


  def empty?
    @bikes.count <= 0 ? true : false
  end


  
end