class CreateFlights < ActiveRecord::Migration[4.2]
  def change
    create_table :flights do |t|
      t.datetime :departure
      t.integer :capacity
      t.integer :price
      t.integer :flight_number
      t.integer :airline_id
    end
  end
end
