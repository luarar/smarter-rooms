class Building < ApplicationRecord
  validates :name, uniqueness: true
  has_many :rooms
    paginates_per 5

end
