class Dealership

  @@dealerships = []
  define_method(:initialize) do |name|
    @name = name
    @id = @@dealerships.length().+(1)
    @cars = []
  end
  define_method(:name) do
    @name
  end

  define_method(:id) do
    @id
  end

  define_method(:cars) do
    @cars
  end

  define_method(:save) do
    @@dealerships.push(self)
  end

  define_singleton_method(:view) do
    @@dealerships
  end

  define_singleton_method(:clear) do
    @@dealerships = []
  end

  define_singleton_method(:find) do |dealership_to_find_id|
    dealership = nil
    @@dealerships.each() do |iterator|
      if iterator.id().==(dealership_to_find_id)
        dealership = iterator
      end
    end
    dealership
  end

  define_method(:add_vehicle) do |vehicle|
    @cars.push(vehicle)
  end
end