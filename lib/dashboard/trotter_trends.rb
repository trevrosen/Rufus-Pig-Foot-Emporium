module Dashboard
	class TrotterTrends
		attr_reader :trendline

		def self.find(bunch=10)
			found = []
			bunch.times  do
				found << new
			end
			found
		end

		def initialize
			@trendline = load_pig_foot_cycle_trends
      self
		end

    def load_pig_foot_cycle_trends
      sleep 2
      point = lambda{(rand(5)+1) + rand()}
      (0..8).inject([]){|arr| arr << [point.call, point.call];arr}
    end
	end
end
