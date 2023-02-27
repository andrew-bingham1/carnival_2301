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
  
  def most_profitable_ride
    most_profit_arr = rides.sort_by {|ride| ride.total_revenue}
    most_profit_arr[-1]
  end

  def total_carnival_revenue
    carnival_revenue = 0 
    @rides.each do |ride|
      carnival_revenue += ride.total_revenue
    end
    carnival_revenue
  end

  def summary
    summary = {}
    total_visitors = []
    carnival_revenue = 0 
    rides.each do |ride|
      total_visitors << ride.rider_log.keys
      carnival_revenue += ride.total_revenue
    end
    summary[:visitor_count] = total_visitors.uniq.count
    summary[:revenue_earned] = carnival_revenue
    summary[total_visitors.uniq] = 
  end
end
