require "docking_station"

describe DockingStation do
it { is_expected.to respond_to :release_bike }

# it ' releases working bikes' do
# 	bike = subject.release_bike
# 	expect(bike).to be_working
# 	end

describe "#release_bike" do
it " raises an error when there are no bike available" do
	# lets not dock a bike 1st, rem Subject == DockingStation.new
	expect {subject.release_bike}.to raise_error "No bikes available"
end

it 'releases a bike' do
	bike = Bike.new
	subject.dock_bike bike
	expect(subject.release_bike).to eq bike
end
end

describe "#dock_bike" do
	it "raises an error when full" do
		subject.capacity.times do
			subject.dock_bike Bike.new
		end
		expect{ subject.dock_bike Bike.new }.to raise_error "Docking station full"
	end
end

it { is_expected.to respond_to(:dock_bike).with(1).argument }
it "docks something" do
	bike = Bike.new
	# we want to return the bike to the docking station
	expect(subject.dock_bike (bike)).to eq [bike]
end

it { is_expected.to respond_to(:bikes) }
it "returns docked bikes" do
	bike = Bike.new
	subject.dock_bike (bike)
	expect(subject.bikes).to eq [bike]
end
end