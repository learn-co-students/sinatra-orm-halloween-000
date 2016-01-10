class Kid < ActiveRecord::Base
  has_one :bucket
  has_many :candies, through: :bucket

  def pig_out(amount_of_candy)
    @kids_stomach = 0
    amount_of_candy.times do 
      to_be_eaten = self.bucket.candies.sample
      self.bucket.candies.delete(to_be_eaten)
      @kids_stomach += 1
    end
    case @kids_stomach
      when 1,2
        self.update(feeling: "Happy")
      when 3,4
        self.update(feeling: "Sick")  
    end
  end
  
end