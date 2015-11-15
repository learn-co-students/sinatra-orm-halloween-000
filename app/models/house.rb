class House < ActiveRecord::Base
  has_many :candies

  def unclaimed_candies
  	candies.select { |e| e.bucket == nil }
  end

  def give_candy(kid)
  	return "You're too old to trick-or-treat." if kid.age >= 18

  	candy = unclaimed_candies.first
  	candy.bucket = kid.bucket
  	candy.save

  	"Happy Halloween!"
  end

end