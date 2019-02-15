class CreateReviews < ActiveRecord::Migration[4.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :flight_id
      t.string :comments
      t.integer :rating, :limit => 5
      t.boolean :would_you_suggest_this_flight
    end
  end
end
