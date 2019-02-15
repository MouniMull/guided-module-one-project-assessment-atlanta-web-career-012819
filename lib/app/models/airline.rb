class Airline < ActiveRecord::Base
  has_many :flights
  has_many :reviews, through: :flights
end
