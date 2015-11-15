class Kid < ActiveRecord::Base
  has_one :bucket

  def pig_out(num)
  	return nil if num <= 0
  	num = self.bucket.candies.size if num > self.bucket.candies.size

  	num.times do
  	  candy = self.bucket.candies.sample
  	  self.bucket.candies.delete(candy)
  	  candy.bucket = nil
  	  candy.save
  	end  

  	(1..2).include?(num) ? self.feeling = "Happy" : self.feeling = "Sick"
    save
  end
end