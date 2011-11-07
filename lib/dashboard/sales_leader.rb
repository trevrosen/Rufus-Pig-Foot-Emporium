class SalesLeader
	attr_reader :name, :sales_quantity, :office

	def initialize
		@name, @office = SalesLeader.random(:name), SalesLeader.random(:office)
		@sales_quantity = SalesLeader.random_sales_quantity
	end
	
	class << self
		def find(bunch)
			found = []
			bunch.times do
				found << new
			end
			found.sort{|a,b|  a.sales_quantity <=> b.sales_quantity}
		end

		def name
			%w(Steve Joe Earle Rasputin Mo William Lucy Norma Linda Roweena Erol Numeyer Jonesy Wicklestein Weinerslave Jorgensen Donaghy Han Laura Stacy Jane Lebowski)
			
		end

		def office
			%w(Reno Harrisonburg Austin Miami Seattle Omaha Mumbai Providence Cancun Rio Sydney Kinshasa Lisbon)
		end

		def random(attr)
			result = self.send(attr)
			size   = result.size
			result[rand(size)]
		end

		def random_sales_quantity
			base = ( (name.to_a.size + office.to_a.size) + 50 )
			foo = ( base * rand(44) + 1 ) / ( rand(3) + 1 ) 
			foo + rand(20) + 1
		end


	end
	
end
