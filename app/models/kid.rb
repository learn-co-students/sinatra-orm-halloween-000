class Kid < ActiveRecord::Base
	has_one :bucket

	def pig_out(number_of_candies)
		number_of_candies.times do
			self.bucket.candies.first.destroy
			self.save
		end
		if number_of_candies == 1 || number_of_candies == 2
			self.feeling = "Happy"
			self.save
		end
		if number_of_candies >= 3
			self.feeling = "Sick"
			self.save
		end
	end

end