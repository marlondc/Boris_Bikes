require 'DockingStation'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }


  it {is_expected.to respond_to(:dock).with(1).argument }
  # expect to accept broken bike 
  it {is_expected.to respond_to(:dock).with(2).argument }

  it {is_expected.to respond_to (:bike)}

  it 'does not release a bike if no bikes available' do
    expect {subject.release_bike}.to raise_error("No bikes available")
  end

  it 'releases working bikes' do
    bike = Bike.new
    expect(bike).to be_working
  end

  # it 'accepts broken bike' do 
  #   expect(subject.dock(Bike.new, true)).to 
  # end

  it 'cannot dock bikes' do
    DockingStation::DEFAULT_CAPACITY.times{subject.dock(Bike.new)}
    expect { subject.dock(Bike.new) }.to raise_error("No more spaces for bikes")

  end

  it 'has a capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock Bike.new }
      expect{ docking_station.dock Bike.new }.to raise_error 'No more spaces for bikes'
    end

    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'No more spaces for bikes'
    end
  end

end


#RAISED ERRORS (NOT SURE IF STILL RELEVANT TO TEST)

#it 'remembers a bike' do
# bike = Bike.new
# expect(subject.dock(bike)).to eq bike


#it 'reports a bike' do
# bike = Bike.new
# subject.dock(bike)
# expect(subject.bike).to eq bike
#end