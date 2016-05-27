require 'DockingStation'

describe DockingStation do
  let(:bike) { double :bike, working?: true }
  
  it { is_expected.to respond_to :release_bike }

  it {is_expected.to respond_to(:dock).with(1).argument }
  # expect to accept broken bike 
  it {is_expected.to respond_to(:dock).with(2).argument }

  it {is_expected.to respond_to (:bike)}

  it 'does not release a bike if no bikes available' do
    expect {subject.release_bike}.to raise_error("No bikes available")
  end

  it 'releases working bikes' do
    expect(bike).to be_working
  end

  it 'return only working bikes' do 
    expect{subject.dock(bike, true).release_bike}.to raise_error("No working bikes available")
    # dock a working bike, dock a broken bike, release a bike and see if it works
    expect(subject.dock(bike).dock(bike, true).release_bike.working?).to be true

  end

  it 'cannot dock bikes' do
    DockingStation::DEFAULT_CAPACITY.times{subject.dock(bike)}
    expect { subject.dock(bike) }.to raise_error("No more spaces for bikes")

  end

  it 'has a capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock bike }
      expect{ docking_station.dock bike }.to raise_error 'No more spaces for bikes'
    end

    subject { DockingStation.new }
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
# bike = bike
# expect(subject.dock(bike)).to eq bike


#it 'reports a bike' do
# bike = bike
# subject.dock(bike)
# expect(subject.bike).to eq bike
#end