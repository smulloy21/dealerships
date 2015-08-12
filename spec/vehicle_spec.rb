require('rspec')
require('vehicle')

describe(Vehicle) do
  describe('#make') do
    it('It will initialize a vehicle and return the make of the vehicle') do
      test_vehicle = Vehicle.new('Toyota', 'Prius', 2006)
      expect(test_vehicle.make()).to(eq('Toyota'))
    end
  end
  describe('#model') do
    it('It will return the model of the vehicle') do
      test_vehicle = Vehicle.new('Toyota', 'Prius', 2006)
      expect(test_vehicle.model()).to(eq('Prius'))
    end
  end
  describe('#year') do
    it('It will return the year of the vehicle') do
      test_vehicle = Vehicle.new('Toyota', 'Prius', 2006)
      expect(test_vehicle.year()).to(eq(2006))
    end
  end

  describe('#save') do
    it('It will add the vehicle to the master array of vehicles') do
      test_vehicle = Vehicle.new('Toyota', 'Prius', 2006)
      test_vehicle.save()
      expect(Vehicle.view()).to(eq([test_vehicle]))
    end
  end

  describe('.clear') do
    it('will empty the master array of vehicles') do
      test_vehicle = Vehicle.new('Toyota', 'Prius', 2006)
      test_vehicle.save()
      Vehicle.clear()
      expect(Vehicle.view()).to(eq([]))
    end
  end

  describe('#id') do
    it('will return the id of a vehicle') do
      test_vehicle = Vehicle.new('Ford ', 'Ranger', 2001)
      test_vehicle.save()
      expect(test_vehicle.id()).to(eq(1))
    end
  end

  describe('.find') do
    it("returns a vehicle by its id number") do
      test_vehicle = Vehicle.new('Ford ', 'Ranger', 2001)
      test_vehicle.save()
      test_vehicle2 = Vehicle.new('Toyota', 'Prius', 2006)
      test_vehicle2.save()
      expect(Vehicle.find(test_vehicle.id())).to(eq(test_vehicle))
    end
  end
  
end
