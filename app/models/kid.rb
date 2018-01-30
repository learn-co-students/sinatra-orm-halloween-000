class Kid < ActiveRecord::Base
  has_one :bucket

  def pig_out(amount)
    candy_db = self.bucket.candies
    amount.times do
      candy_db.last.destroy
    end

    if amount < 3
      self.update(:feeling => "Happy")
      return self.feeling
    elsif amount >= 3
      self.update(:feeling => "Sick")
      return self.feeling
    end

  end

end
