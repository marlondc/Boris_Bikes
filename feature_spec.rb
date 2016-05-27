require './lib/Bike.rb'
require './lib/DockingStation.rb'

station = DockingStation.new
bike = Bike.new

station.dock(bike, true)

5.times{ station.dock(Bike.new) }
2.times{ station.dock(Bike.new) }
