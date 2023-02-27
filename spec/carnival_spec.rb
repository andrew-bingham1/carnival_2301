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


end