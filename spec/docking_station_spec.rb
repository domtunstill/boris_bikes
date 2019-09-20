require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it 'responds to docks a bike' do
    expect(subject).to respond_to(:dock_bike).with(1).argument
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock_bike(bike)[0]).to eq bike
  end

  describe '#dock_bike' do
    it 'raise error if docking station is full with custom capactiy' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock_bike Bike.new }
      expect { docking_station.dock_bike(Bike.new) }.to raise_error("Docking station is full")
    end

    it 'raise error if docking station is full with default capactiy' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike Bike.new }
      expect { subject.dock_bike(Bike.new) }.to raise_error("Docking station is full")
    end

  end

  describe '#release_bike' do

    it 'raise error if docking station empty' do
    expect { subject.release_bike }.to raise_error("No bikes available")
    end

    it 'releases a working bike' do
      subject.dock_bike(Bike.new)
      bike = subject.release_bike
      expect(bike.working?).to eq true
    end

    it "doesn't release a broken bike" do
      bike = Bike.new
      bike.report_broken
      subject.dock_bike(bike)
      expect{ subject.release_bike }.to raise_error ("No working bikes")
    end

  end

end
