class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references :arrival_airport, foreign_key: { to_table: :airports }
      t.references :departure_airport, foreign_key: {to_table: :airports }
      t.date :departure_date
      t.integer :duration

      t.timestamps
    end
  end
end
