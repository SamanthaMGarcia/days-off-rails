class Request < ApplicationRecord
  belongs_to :user
  belongs_to :day

  def day_attributes=(day_hash)
    ymd = "#{day_hash["dayoff(1i)"]} - #{day_hash["dayoff(2i)"]} - #{day_hash["dayoff(3i)"]}"
    Day.find_or_create_by(:dayoff => ymd)
  end
end


# def categories_attributes=(categories_hashes)
#      categories_hashes.each do |i, category_attributes|
#        if category_attributes[:name].present?
#          category = Category.find_or_create_by(name: category_attributes[:name])
#          if !self.categories.include?(category)
#        self.post_categories.build(:category => category)
#        end
#      end
#    end
#  end
# end

#self.day= Day.find_or_create_by(:dayoff => ymd)
#self.save
