require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it 'responds to docks a bike' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'docks a bike' do
    bike = double(:bike)
    expect(subject.dock(bike)[0]).to eq bike
  end

  describe '#dock' do
    it 'raise error if docking station is full with custom capactiy' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock double(:bike) }
      expect { docking_station.dock(double(:bike)) }.to raise_error("Docking station is full")
    end

    it 'raise error if docking station is full with default capactiy' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock double(:bike) }
      expect { subject.dock(double(:bike)) }.to raise_error("Docking station is full")
    end

  end

  describe '#release_bike' do

    it 'raise error if docking station empty' do
    expect { subject.release_bike }.to raise_error("No bikes available")
    end

    it 'releases a working bike' do
      bike = double(:bike, working?: true)
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike.working?).to eq true
    end

    it "doesn't release a broken bike" do
      bike = double(:bike, working?: false)
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error ("No working bikes")
    end

  end

end
