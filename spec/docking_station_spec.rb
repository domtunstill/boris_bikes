require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
end

describe DockingStation do
  describe '.release_bike' do
    it { is_expected.to respond_to(:working?) }
  end
end
