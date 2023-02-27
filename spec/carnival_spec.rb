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

  describe '#most_popular_ride' do 
    it 'can determine most popular ride' do 
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
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor3.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
     

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor3)

      ride2.board_rider(visitor1)
      ride2.board_rider(visitor2)

      ride3.board_rider(visitor2)
      expect(carnival.most_popular_ride).to eq(ride1)
    end
  end

  describe '#most_profitable_ride' do 
    it 'can tell the most profitable ride' do
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
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor3.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
     

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor3)

      ride2.board_rider(visitor1)
      ride2.board_rider(visitor2)

      ride3.board_rider(visitor2)

      expect(carnival.most_profitable_ride).to eq(ride2)
    end
  end

  describe '#total_carnival_revenue' do
    it 'can give total revenue from all rides' do 
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
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor3.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
     

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor3)

      ride2.board_rider(visitor1)
      ride2.board_rider(visitor2)

      ride3.board_rider(visitor2)

      expect(carnival.total_carnival_revenue).to eq(15)
    end
  end



end