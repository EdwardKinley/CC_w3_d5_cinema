require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')
require_relative('../models/screening.rb')

require('pry-byebug')

Ticket.delete_all()
Screening.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => 'Albert', 'funds' => 4400})
customer1.save()

customer2 = Customer.new({'name' => 'Brenda', 'funds' => 4500})
customer2.save()

customer3 = Customer.new({'name' => 'Caroline', 'funds' => 9000})
customer3.save()

customer4 = Customer.new({'name' => 'Draco', 'funds' => 8765})
customer4.save()

film1 = Film.new({'title' => 'Amadeus'})
film1.save()

film2 = Film.new({'title' => 'Brotherhood of the Wolf'})
film2.save()

film3 = Film.new({'title' => 'Charlie and the Chocolate Factory'})
film3.save()

film4 = Film.new({'title' => 'Dead Man'})
film4.save()

screening1 = Screening.new({'film_id' => film1.id, 'time' => '18:45', 'price' => 800, 'capacity' => 50})
screening1.save()

screening2 = Screening.new({'film_id' => film1.id, 'time' => '21:00', 'price' => 1100, 'capacity' => 40})
screening2.save()

screening3 = Screening.new({'film_id' => film2.id, 'time' => '19:00', 'price' => 1000, 'capacity' => 60})
screening3.save()

screening4 = Screening.new({'film_id' => film3.id, 'time' => '17:30', 'price' => 1200, 'capacity' => 55})
screening4.save()

screening5 = Screening.new({'film_id' => film3.id, 'time' => '18:00', 'price' => 1200, 'capacity' => 38})
screening5.save()

screening6 = Screening.new({'film_id' => film4.id, 'time' => '19:30', 'price' => 950, 'capacity' => 90})
screening6.save()

screening7 = Screening.new({'film_id' => film4.id, 'time' => '23:30', 'price' => 850, 'capacity' => 3})
screening7.save()

ticket1 = customer1.buy_ticket(screening1)
ticket2 = customer1.buy_ticket(screening2)
ticket3 = customer1.buy_ticket(screening4)
ticket4 = customer2.buy_ticket(screening5)
ticket5 = customer3.buy_ticket(screening6)
ticket6 = customer4.buy_ticket(screening5)
ticket7 = customer1.buy_ticket(screening5)
ticket8 = customer2.buy_ticket(screening6)
ticket9 = customer3.buy_ticket(screening7)
ticket10 = customer4.buy_ticket(screening7)
ticket11 = customer2.buy_ticket(screening7)
ticket12 = customer3.buy_ticket(screening5)

binding.pry
nil
