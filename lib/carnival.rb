class Carnival
  attr_reader :duration,
              :rides

  def initialize(num_of_weeks)
    @duration = "#{num_of_weeks} weeks"
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    most_pop_arr = rides.sort_by {|ride| ride.total_rides}
    most_pop_arr[-1]
  end
end
