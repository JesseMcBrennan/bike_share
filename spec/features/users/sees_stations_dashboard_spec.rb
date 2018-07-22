require 'rails_helper'

describe 'visiting the /stations-dashboard' do
  before :each do
    station_1 = Station.create(name: 'San Jose City Hall', city: 'San Jose', dock_count: 4, installation_date: 8/6/2013)
    station_2 = Station.create(name: 'Mountain View City Hall', city: 'Mountain View', dock_count: 5, installation_date: 8/16/2014)
    station_3 = Station.create(name: 'Market at 10th', city: 'San Francisco', dock_count: 6, installation_date: 1/23/2016)
    visit stations_dashboard_path
  end

  it 'sees a total count of stations' do
    expect(page).to have_content("Total Number of Stations: #{Station.total_count}")
  end

  xit 'sees average bikes available per station' do
    expect(page).to have_content("Average Bikes Available per Station: #{Station.avg_bikes_per_station}")
  end

  xit 'sees most bikes available at a station' do
    expect(page).to have_content("Highest Bike Count: #{Station.highest_bike_total}")
  end

  xit 'sees the station that has the most bikes available' do
    expect(page).to have_content("Station with Most Bikes Available: #{Station.with_highest_inventory}")
  end

  xit 'sees fewest bikes available at a station' do
    expect(page).to have_content("Lowest Bike Count: #{Station.lowest_bike_total}")
  end

  xit 'sees the station that has the fewest bikes available' do
    expect(page).to have_content("Station with Least Bikes Available: #{Station.with_lowest_inventory}")
  end

  xit 'sees the newest station' do
    expect(page).to have_content("Newest Station: #{Station.newest}")
  end

  xit 'sees the oldest station' do
    expect(page).to have_content("Oldest Station: #{Station.oldest}")
  end
end
