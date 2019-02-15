class CreateAirlines < ActiveRecord::Migration[4.2]
  def change
    create_table :airlines do |t|
      t.string :company_name
    end
  end
end
