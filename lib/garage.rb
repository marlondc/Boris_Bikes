class Garage
  
  def initialize
    @storage = []
  end

  def release_bikes
    # fail "No bikes available" if empty? && @broken_bikes.empty?
    # fail "No working bikes available" if empty? && !@broken_bikes.empty?
    # @bikes.pop
    temp = @storage
    @storage = []
    temp
  end


  def dock(bike)
    #fail "No more spaces for bikes" if full?
    # bike.broken? ? @broken_bikes << bike : @bikes << bike
    @storage.concat(bike.map! {|b| b.report_broken(false)})
    self
  end

end