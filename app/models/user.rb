class User < ApplicationRecord
  has_many :requests
  has_many :days, through: :requests
  has_many :titles
  has_secure_password
  validates :username, uniqueness: true
  validates :username, presence: true
end
