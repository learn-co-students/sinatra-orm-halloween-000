class House < ActiveRecord::Base
  has_many :candies

  def unclaimed_candies
    self.candies.where(bucket_id: nil)
  end
  
  def give_candy(kid)
    if kid.age < 18
      candy_for_kid = unclaimed_candies.first
      kid.bucket.candies << candy_for_kid
      kid.save
      "Happy Halloween!"
    else
      "You're too old to trick-or-treat."
    end
  end

end