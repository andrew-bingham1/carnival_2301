class Carnival
  attr_reader :duration,
              :rides

  def initialize(num_of_weeks)
    @duration = "#{num_of_weeks} weeks"
    @rides = []
  end
  
end
