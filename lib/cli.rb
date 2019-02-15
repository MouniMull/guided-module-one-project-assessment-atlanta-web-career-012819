class CommandLineInterface


  def initiliaze

    @user = nil

  end

  def begin_app
    greet
  end

  def greet
    puts "welcome to skye's flight reviewer application!"
      sleep 2
    puts ""
    puts "We know how frustrating airlines can be! This is an application where users can share their experiences with recent trips and review their respective flights!"
      sleep 2
    puts ""
    puts "if you would like to conitnue with the app, please type 'continue'"
      continue = "continue"
      continue = gets.chomp
        if continue != "continue"
          goodbye
        else
          welcome

    end
    puts ""
    sleep 1
    options


  end


  def welcome
    puts ""
    puts "welcome to Skye!"
    sleep 2
    puts ""
    puts "please enter your name"
    puts ""

    collect_name

    puts ""


  end


  def collect_name
    name = gets.chomp
    puts ""
    puts "Welcome, #{name}!"
    @user = User.create(name: name)
  end

    def create_review
      puts "Here is a list of all domestic flights in the United States. Which flight would you like to review?"
      puts f_number = Flight.all.map {|n| n.flight_number}

      puts "what is your flight number"
      flight_number = gets.chomp
      flight = Flight.find_by(flight_number: flight_number)
      puts "Write a Review of your experience!"
      comments = gets.chomp
      puts "What would you rate your experience on a scale of 1-5"
      rating = gets.chomp
      puts "would you suggest this flight in the future? YES or NO"
      would_you_suggest_this_flight = gets.chomp
      if would_you_suggest_this_flight == "YES"
        would_you_suggest_this_flight = true
      else
        would_you_suggest_this_flight = false
      end
      Review.create(user_id: @user.id,flight_id: flight.id, comments: comments, rating: rating, would_you_suggest_this_flight: would_you_suggest_this_flight)


      options

      # binding.pry
      # flight.reviews.create(user_id: @user.id, comments: comments, rating: rating, would_you_suggest_this_flight: would_you_suggest_this_flight)
      # @user.reviews.create(flight_id: comments: comments, rating: rating, would_you_suggest_this_flight: would_you_suggest_this_flight)
    end



def options
  puts "What would you like to do?"
  puts "--------------------------"
  puts ""
  puts "WRITE A NEW REVIEW (1)"
  puts "CHECK OUT ALL AIRLINES (2)"
  puts "READ ALL REVIEWS (3)"
  puts "CHECK OUT MY PAST FLIGHTS(4)"
  puts "DELETE MY REVIEW (5)"
  puts "UPDATE EXISTING REVIEW (6)"
  # puts "FLIGHT SUGGESTIONS"
  puts "QUIT"
typed_number = gets.chomp
  if typed_number == "1"
  create_review
elsif typed_number == "4"
  check_past_flights
elsif typed_number == "5"
  delete_reviews
elsif typed_number == "6"
  update_reviews
elsif typed_number == "3"
  read_reviews
elsif typed_number == "2"
  check_out_all_airlines
else
  goodbye
end
end

  def check_past_flights
    puts "Your previous flight numbers are.."
    puts ""
   @user.flights.each do |flight|
     puts flight.flight_number

  end
    options
  end

  def delete_reviews
    my_reviews = Review.find_by(user_id: @user.id)

    puts "Are you sure you want to delete your review?"
    puts ""
    puts "YES or NO"
    puts ""



    puts "User_ID: #{my_reviews.user_id}"
    puts "Flight_ID: #{my_reviews.flight_id}"
    puts "Comments: #{my_reviews.comments}"
    puts "Rating #{my_reviews.rating}"
    puts "Would You Suggest This Flight: #{my_reviews.would_you_suggest_this_flight}"
    # f_number = Flight.all.map {|n| n.flight_number}

    remove = gets.chomp
    if remove == "YES"
    my_reviews.delete
    else
  end

    options

  end

  def update_reviews
  my_reviews = Review.find_by(user_id: @user.id)



    puts "User_ID: #{my_reviews.user_id}"
    puts "Flight_ID: #{my_reviews.flight_id}"
    puts "Comments: #{my_reviews.comments}"
    puts "Rating #{my_reviews.rating}"
    puts "Would You Suggest This Flight: #{my_reviews.would_you_suggest_this_flight}"

    puts ""

    puts "Update Your Comment"
    new_comment = gets.chomp
    my_reviews.update(comments: new_comment)
    puts ""
    puts "Update your rating from 1-5"
    new_rating = gets.chomp
    my_reviews.update(rating: new_rating)
    puts ""
    puts "Update your flight recommendation"
    new_boolean = gets.chomp
    my_reviews.update(would_you_suggest_this_flight: new_boolean)


  options



  end

  def read_reviews
    Review.all.each do |rev|
    puts "USER NAME:   #{rev.user_id}"
    puts "Flight_ID:   #{rev.flight}"
    puts "COMMENTS:  #{rev.comments}"
    puts "RATING:   #{rev.rating}"
    puts "WOULD YOU SUGGEST THIS FLIGHT? #{rev.would_you_suggest_this_flight}"
  end
  options
  end

    # puts "User_ID: #{all_review.user_id}"
    # puts "Flight_ID: #{all_review.flight_id}"
    # puts "Comments: #{all_review.comments}"
    # puts "Rating #{all_review.rating}"
    # puts "Would You Suggest This Flight: #{all_review.would_you_suggest_this_flight}"
# options

  def check_out_all_airlines
    Airline.all.each { |a| puts a.company_name }
    options
  end

  # def flight_options
  #   puts "What is your price range?"
  #     price_limit = gets.chomp
  #     if price_limit < Flight.all.price
  #       Flight.all.each{|p| p.price < price_limit}
  #       puts p
  #
  #     else
  #       puts ""
  #       puts "sorry we do not have any flight reccomendartions"
  #     end



  def goodbye
    puts ""
    puts "goodbye!"
    exit
  end

end
