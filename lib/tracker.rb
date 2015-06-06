require 'csv'

class Pass
  attr_accessor :price

  def initialize(csv)
    @csv = csv
    @trips = trips
    @price = Float(price)
    result
  end

  def result
    p "You've gone on #{self.trips.length} trips this month."
    p "The average cost per trip is $#{self.cost_per_trip}."
  end

  def price
    116.00
  end

  def price_in_cents
    Integer(price * 100 + 0.5)
  end

  def cost_per_trip
    in_cents = Float(price_in_cents/@trips.length)
    Float(in_cents/100)
  end

  def response
    "$#{cost_per_trip}"
  end
  
  def trips(all = []) 
    CSV.foreach("#{@csv}") do |trip|
      all << Trip.new(trip)
    end
    all
  end

  class Trip
    attr_reader :detail

    def initialize(detail)
      @detail = detail
      @start = start
      @finish = finish
      @line = line
      @date = date
    end

    def start
      detail[0]
    end

    def finish
      detail[1]
    end

    def line
      detail[2]
    end

    def date
      detail[3]
    end
  end
end

j = Pass.new("june.csv")
#j.result
