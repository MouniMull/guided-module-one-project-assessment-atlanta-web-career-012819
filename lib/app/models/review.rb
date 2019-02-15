class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :flight
  has_many :airlines, through: :flight
end
