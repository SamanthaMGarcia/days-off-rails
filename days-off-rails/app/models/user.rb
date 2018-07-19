class User < ApplicationRecord
  has_many :requests
  has_many :days, through: :requests
end
