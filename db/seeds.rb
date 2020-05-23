Airport.create!(code: 'ORD')
Airport.create!(code: 'LAX')
Airport.create!(code: 'SFO')
Airport.create!(code: 'NYC')

4.times do 
  date = Date.today+rand(100)
  arrive_airport = Random.rand(4)+1
  depart_airport = Random.rand(4)+1
  arrive_airport = Random.rand(4)+1 if arrive_airport == depart_airport


  5.times do |num|
    Flight.create!(arrival_airport_id: arrive_airport, 
                    departure_airport_id: depart_airport,
                    departure_date: date,
                    duration: 4.hours)
  end
end