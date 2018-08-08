class Request < ApplicationRecord
  belongs_to :user
  belongs_to :day

  def day_attributes=(day_hash)
    ymd = "#{day_hash["dayoff(1i)"]}-#{day_hash["dayoff(2i)"]}-#{day_hash["dayoff(3i)"]}"
    self.day = Day.find_or_create_by(:dayoff => ymd)
    self.save
  end

  # def ymd
  #   ymd = "#{day_hash["dayoff(1i)"]} - #{day_hash["dayoff(2i)"]} - #{day_hash["dayoff(3i)"]}"
  # end
end
