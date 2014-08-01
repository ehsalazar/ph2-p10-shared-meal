class Meal < ActiveRecord::Base
  validates :location, presence: true
  belongs_to :user
end

