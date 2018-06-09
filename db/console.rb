require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')
require_relative('../models/screening.rb')

require('pry-byebug')

Ticket.delete_all()
Screening.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => 'Albert', 'funds' => 2000})
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

ticket1 = Ticket.new({'customer_id' => customer1.id, 'screening_id' => screening1.id})
ticket1.save()

ticket2 = Ticket.new({'customer_id' => customer1.id, 'screening_id' => screening2.id})
ticket2.save()

ticket3 = Ticket.new({'customer_id' => customer2.id, 'screening_id' => screening3.id})
ticket3.save()

ticket4 = Ticket.new({'customer_id' => customer3.id, 'screening_id' => screening3.id})
ticket4.save()

ticket5 = Ticket.new({'customer_id' => customer1.id, 'screening_id' => screening4.id})
ticket5.save()

ticket6 = Ticket.new({'customer_id' => customer2.id, 'screening_id' => screening5.id})
ticket6.save()

ticket7 = Ticket.new({'customer_id' => customer3.id, 'screening_id' => screening6.id})
ticket7.save()

ticket8 = Ticket.new({'customer_id' => customer4.id, 'screening_id' => screening5.id})
ticket8.save()

ticket9 = Ticket.new({'customer_id' => customer1.id, 'screening_id' => screening5.id})
ticket9.save()

ticket10 = Ticket.new({'customer_id' => customer2.id, 'screening_id' => screening6.id})
ticket10.save()

ticket11 = Ticket.new({'customer_id' => customer3.id, 'screening_id' => screening7.id})
ticket11.save()

ticket12 = Ticket.new({'customer_id' => customer4.id, 'screening_id' => screening7.id})
ticket12.save()

binding.pry
nil
