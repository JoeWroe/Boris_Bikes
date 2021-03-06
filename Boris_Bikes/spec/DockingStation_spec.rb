require 'DockingStation'

describe DockingStation do
  subject(:DockingStation) {described_class.new}
  let(:bike) { double :bike }

  describe '#capacity' do

    context 'responds to "bike"'
      it { is_expected.to respond_to(:bikes)}

    it 'expects DEFAULT_CAPACITY to equal 20' do
      expect( DockingStation::DEFAULT_CAPACITY ).to eq 20
    end

    it 'expects "DEFAULT_CAPACITY" to change to a random user request' do
      while true
        capacity = rand(999)
        if capacity == 20
          true
        else
          break
        end
      end
      new_DockingStation_class = DockingStation.new(capacity)
      expect( new_DockingStation_class.capacity ).not_to eq 20
    end

  end

  describe '#release_bike' do

    it 'expects "release_bike" to get bike' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike) #GUARD
      expect(subject.release_bike).to eq bike
    end

    it 'raises error "No Bikes Available" when docking station is empty' do
      expect { subject.release_bike }.to raise_error("No Bikes Available")
    end

    it 'raises error "No working bikes." when there are no working bikes' do
      bike = Bike.new #GAURD
      bike.report_broken #GUARD
      subject.dock(bike) #GAURD
      expect { subject.release_bike }.to raise_error("No working bikes.")
    end

    it 'knows when a working bike has been removed from the docking station' do
      bike = Bike.new
      subject.dock(bike)
      subject.release_bike
      expect(subject.bikes).to eq []
    end

  end

  describe '#return_bike' do

    it 'raises error "Docking Station Full" when docking station capacity is reached' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) } #GUARD CONDITION
      expect { subject.dock(Bike.new) }.to raise_error("Docking Station Full")
    end

    context 'responds to "dock" with one argument'
      it { is_expected.to respond_to(:dock).with(1).argument}

  end
end
