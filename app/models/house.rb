class House < ActiveRecord::Base
  has_many :candies

  def unclaimed_candies
    unclaimed = []
    self.candies.each do |candy|
      if candy.bucket_id == nil
        unclaimed << candy
      end
    end
    return unclaimed
  end

  def give_candy(kid)
    if kid.age < 18
      unclaimed_candies.first.update(:bucket_id => kid.bucket.id) 
      return "Happy Halloween!"
    elsif kid.age >= 18
      return "You're too old to trick-or-treat."
    end
  end

end
