require 'docking_station.rb'

describe DockingStation do
  subject(:station){DockingStation.new}
  test_bike = Bike.new
  it {is_expected.to respond_to :release_bike}

  it 'checks if bike is docked' do
    station.bikes << [test_bike]
    expect(station.station_has_bike?).to be_truthy
  end

  it 'cannot dock bike when is station is full' do
   20.times do 
     station.dock_working_bike
   end
   expect {station.dock_working_bike}.to raise_error
   end

  it 'raise error when releasing bike from empty station' do
    bikes = []
    expect(station.release_bike).to eq "No working bike available"
  end

  it 'allows the client to specify capacity' do
    client_station = DockingStation.new(10)
    expect(client_station.capacity).to eq 10
  end

  it 'does not release broken bikes' do
    station.dock_broken_bike
    expect(station.release_bike).to eq "No working bike available"
  end

end
