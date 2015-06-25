require 'pry'
require 'csv'

class Subway

  def self.run(argv)
   j = Pass.new(argv[0],argv[1])
   j.result
   0 #exit status
  end
  
  class Pass
    attr_accessor :price

    def initialize(csv,price)
      @csv = csv
      @trips = all_trips
      @price = price_in_cents(price) 
    end

    def result
      p "You've gone on #{@trips.length} trips this month."
      p "The average cost per trip is $#{self.cost_per_trip}."
    end

    def price_in_cents(price)
      Integer(price.sub("$","").to_f * 100)
    end

    def cost_per_trip
      in_cents = Float(@price/@trips.length)
      Float(in_cents/100)
    end

    def response
      "$#{cost_per_trip}"
    end
    
    def all_trips(all = [])
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
end
