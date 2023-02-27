class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money
    @preferences = [] 
  end

  def add_preference(pref)
    @preferences << pref
  end

  def tall_enough?(h)
    if @height >= h
      true
    else
      false
    end
  end
end
