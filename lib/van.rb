class Van
  
  def initialize
    @storage = []
  end

  def release_bikes
    temp = @storage
    @storage = []
    temp
  end


  def dock(bike)
    #fail "No more spaces for bikes" if full?
    # bike.broken? ? @broken_bikes << bike : @bikes << bike
    @storage.concat(bike)
    # @storage << bike : [1,2,3] << [4,5,6] == [1,2,3,[4,5,6]]
    # @storage.concat(bike) : [1,2,3].concat([4,5,6]) == [1,2,3,4,5,6]
    self
  end



end