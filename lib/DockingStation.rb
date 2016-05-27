require_relative 'Bike'

class DockingStation


	attr_reader :bike, :capacity

	DEFAULT_CAPACITY = 20


	def initialize(capacity=DEFAULT_CAPACITY)
		@bikes = []
		@broken_bikes = []
		@capacity = capacity
	end


	def release_bike
		fail "No bikes available" if empty?
		@bikes.pop
	end


	def dock(bike, broken = false)
		fail "No more spaces for bikes" if full?

		broken ? @broken_bikes << bike : @bikes << bike
	end

	private

	def full?
		@bikes.count >= capacity ? true : false
	end


	def empty?
		@bikes.count <= 0 ? true : false
	end



end