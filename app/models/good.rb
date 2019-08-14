class Good < ApplicationRecord
  validates :name, uniqueness: true
  has_many :roomgoods
  has_many :rooms, through: :roomgoods
end
