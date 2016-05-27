require './lib/Bike.rb'
require './lib/DockingStation.rb'

station = DockingStation.new
bike = Bike.new

p station.dock(Bike.new).dock(bike, true).release_bike.working?

5.times{ station.dock(Bike.new) }
2.times{ station.dock(Bike.new) }
