require('rspec')
require('dealership')
require('vehicle')

describe(Dealership) do

  before() do
    Dealership.clear()
  end

  describe('#name') do
    it("returns the name of the dealership") do
      test_dealership = Dealership.new("Jane's Auto")
      expect(test_dealership.name()).to(eq("Jane's Auto"))
    end
  end

  describe('#id') do
    it('returns the id of a dealership') do
      test_dealership = Dealership.new("Jane's Auto")
      expect(test_dealership.id()).to(eq(1))
    end
  end

  describe('#cars') do
    it('returns an empty array of the cars in the dealership') do
      test_dealership = Dealership.new("Henry's New Cars")
      expect(test_dealership.cars()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a dealership to the array of saved dealerships') do
      test_dealership = Dealership.new("Henry's New Cars")
      test_dealership.save()
      expect(Dealership.view()).to(eq([test_dealership]))
    end
  end

  describe(".view") do
    it("is empty at first") do
      expect(Dealership.view()).to(eq([]))
    end
  end

  describe(".clear") do
    it("clears the list of dealerships") do
      test_dealership = Dealership.new("Henry's New Cars")
      test_dealership.save()
      Dealership.clear()
      expect(Dealership.view()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a dealership based on its id") do
      test_dealership = Dealership.new("Bob's Used Cars")
      test_dealership.save()
      test_dealership2 = Dealership.new("Jane's Cars")
      test_dealership2.save()
      expect(Dealership.find(test_dealership.id())).to(eq(test_dealership))
    end
  end

  describe('#add_vehicle') do
    it('adds new vehicle to specific dealership') do
      test_dealership = Dealership.new("Bob's Used Cars")
      test_dealership.save()
      test_vehicle = Vehicle.new('Chevrolet', 'Suburban', 1998)
      test_dealership.add_vehicle(test_vehicle)
      expect(test_dealership.cars()).to(eq([test_vehicle]))
    end
  end

end
