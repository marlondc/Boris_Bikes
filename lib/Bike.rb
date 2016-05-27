class Bike

	def report_broken(bool=true)
		@broken = bool
		self
	end

	def broken?
		@broken ||= false 
	end
end 
