class Day < ApplicationRecord
  has_many :requests
  has_many :users, through: :requests

  def self.sorted_days
    order(dayoff: :asc)
  end
end
