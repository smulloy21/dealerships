require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')
require('./lib/dealership')

get('/') do
  erb(:index)
end

get('/dealerships') do
  @dealerships = Dealership.view()
  erb(:dealerships)
end

post('/dealerships') do
  name = params.fetch('name')
  dealership = Dealership.new(name)
  dealership.save()
  erb(:dealership_success)
end

get('/dealership/:id') do
  @dealership = Dealership.find(params.fetch("id").to_i())
  erb(:dealership)
end

post('/dealership/:id') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  @dealership = Dealership.find(params.fetch("id").to_i())
  @vehicle = Vehicle.new(make, model, year)
  @dealership.add_vehicle(@vehicle)

  erb(:dealership)
end

get("/dealerships/new") do
  erb(:dealership_form)
end


get('/vehicles') do
  @vehicles = Vehicle.view()
  erb(:vehicles)
end

get('/vehicles/new') do
  erb(:vehicles_form)
end

post('/vehicles') do
  make = params.fetch("make")
  model = params.fetch("model")
  year = params.fetch("year").to_i()
  vehicle = Vehicle.new(make, model, year)
  vehicle.save()
  erb(:success)
end

get('/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch("id").to_i())
  erb(:vehicle)
end
