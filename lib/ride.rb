class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log,
              :total_rides
             
  def initialize(details)
    @name = details[:name]
    @min_height = details[:min_height]
    @admission_fee = details[:admission_fee]
    @excitement = details[:excitement]
    @total_revenue = 0 
    @rider_log = Hash.new(0)
    @total_rides = 0
  end

  def board_rider(visitor)
    if visitor.preferences.include?(@excitement) && visitor.tall_enough?(@min_height) && visitor.spending_money >= @admission_fee
      @rider_log[visitor] += @admission_fee
      visitor.spending_money -= @admission_fee
      @total_revenue += @admission_fee
      @total_rides += 1 
    end
  end

end
