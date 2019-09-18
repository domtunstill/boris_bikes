require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it 'releases a working bike' do
    bike = subject.release_bike
    expect(bike.working?).to eq true
  end

  it 'responds to docks a bike' do
    expect(subject).to respond_to(:dock_bike).with(1).argument
  end

  it 'docks a bike' do
    bike = subject.release_bike
    expect(subject.dock_bike(bike)).to eq bike
  end

end
