require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the path of adding a dealership', {:type => :feature}) do
  it('adds a dealership to the dealership list') do
    visit('/dealerships/new')
    fill_in('name', :with => "Henry's Cars")
    click_button('Add dealership')
    click_link('List of dealerships')
    expect(page).to have_content("Henry's Cars")
  end
end

describe('the path of adding a car to a dealership', {:type => :feature}) do
  it('adds a car to a dealership') do
    visit('/dealerships/new')
    fill_in('name', :with => "Joe's Cars")
    click_button('Add dealership')
    click_link('List of dealerships')
    click_link("Joe's Cars")
    fill_in('make', :with => 'Toyota')
    fill_in('model', :with => 'Highlander')
    fill_in('year', :with => '2008')
    click_button('Add Vehicle')
    expect(page).to have_content('Toyota, Highlander, 2008')
  end
end
