require 'rails_helper'

describe 'visiting station index page can see all stations with attributes' do
  it 'can see edit and delete buttons alongside each station' do
    admin = User.create(first_name: 'Boss',last_name: 'Lady', street: '123 Main St', city: 'Denver', state: 'CO', zip_code: '80304', email: 'Jeff@Turing.com', password: 'password', role: 1 )
    station_1 = Station.create(name: 'San Jose City Hall', city: 'San Jose', dock_count: 15, installation_date: Date.strptime('8/6/2013', '%m/%d/%Y'))
    station_2 = Station.create(name: 'Mountain View City Hall', city: 'Mountain View', dock_count: 17, installation_date: Date.strptime('8/16/2014', '%m/%d/%Y'))
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit stations_path

    expect(current_path).to eq(stations_path)
    expect(page).to have_content(station_1.name)
    expect(page).to have_content(station_2.name)
    expect(page).to have_content(station_1.dock_count)
    expect(page).to have_content(station_2.dock_count)
    expect(page).to have_content(station_1.city)
    expect(page).to have_content(station_2.city)
    expect(page).to have_content(station_1.installation_date)
    expect(page).to have_content(station_2.installation_date)
    expect(page).to have_button('Edit')
    expect(page).to have_button('Delete')
  end

  it 'can delete a station from the index page' do
    admin = User.create(first_name: 'Boss',last_name: 'Lady', street: '123 Main St', city: 'Denver', state: 'CO', zip_code: '80304', email: 'Jeff@Turing.com', password: 'password', role: 1 )
    station_3 = Station.create(name: 'San Jose City Hall', city: 'San Jose', dock_count: 15, installation_date: Date.strptime('8/6/2013', '%m/%d/%Y'))
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit "/#{station_3.name.parameterize}"

    click_button 'Delete'

    expect(current_path).to eq(stations_path)
    expect(page).to_not have_content('San Jose City Hall')
    expect(page).to have_content("Successfully deleted trip ##{station_3.id}.")
  end
end
