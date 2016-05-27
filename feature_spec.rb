require './lib/Bike.rb'
require './lib/DockingStation.rb'
require './lib/van.rb'
require './lib/garage.rb'

station = DockingStation.new
bike = Bike.new
bike2 = Bike.new
bike3 = Bike.new
new_bike = bike.report_broken
new_bike2 = bike3.report_broken
p station.dock(new_bike)
p station.dock(bike2)
p station.dock(new_bike2)
p station.bikes
van = Van.new
p van.dock(station.release_bikes)
garage = Garage.new
p garage.dock(van.release_bikes)
p van.dock(garage.release_bikes)
p station.dock(van.release_bikes)