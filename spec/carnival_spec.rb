require 'rspec'
require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do 
  describe '#initialize' do
    it 'can initialize' do
      carnival = Carnival.new(4)

      expect(carnival).to be_a Carnival
      expect(carnival.duration).to eq("4 weeks")
      expect(carnival.rides).to eq([])
    end
  end

  describe '#add_ride' do
    it 'can add rides' do
      carnival = Carnival.new(4)
      ride1 = Ride.new({
        name: 'Carousel',
        min_height: 24,
        admission_fee: 1,
        excitement: :gentle
        })

      ride2 = Ride.new({
        name: 'Ferris Wheel',
        min_height: 36,
        admission_fee: 5,
        excitement: :gentle
        })

      ride3 = Ride.new({
        name: 'Roller Coaster',
        min_height: 54,
        admission_fee: 2,
        excitement: :thrilling
        })

      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      expect(carnival.rides).to eq([ride1,ride2,ride3])
    end
  end



end