class Title < ApplicationRecord
  belongs_to :user
  validates :title_name, presence: true
end
