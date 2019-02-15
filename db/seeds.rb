Airline.destroy_all
User.destroy_all
Flight.destroy_all
Review.destroy_all

10.times do
User.create(name: Faker::Name.name)
end

# 10.times do
# Airline.create(company_name: Faker::Company.name)
# end

Airline.create(company_name: "Alaska Air")
Airline.create(company_name: "Allegiant Air")
Airline.create(company_name: "American Airlines")
Airline.create(company_name: "Delta Airlines")
Airline.create(company_name: "Frontier, Airlines")
Airline.create(company_name: "Hawaiian Airlines")
Airline.create(company_name: "JetBlue")
Airline.create(company_name: "Southwest Airlines")
Airline.create(company_name: "Spirit Airlines")
Airline.create(company_name: "United Airlines")


50.times do
  Flight.create(
    departure: Faker::Time.between(Date.today, 1.year.from_now),
    capacity: Faker::Number.between(50, 100),
    price: Faker::Number.between(10000, 50000).to_f/100,
    flight_number: Faker::Number.between(2, 2000),
    airline_id: Airline.all.sample.id
  )
end

300.times do
  Review.create(
    user_id: User.all.sample.id,
    flight_id: Flight.all.sample.id,
    comments: Faker::Hacker.say_something_smart,
    rating: Faker::Number.between(1, 5),
    would_you_suggest_this_flight: Faker::Boolean.boolean
  )

end
