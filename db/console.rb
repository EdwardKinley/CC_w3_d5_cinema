require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')

require('pry-byebug')

Ticket.delete_all()
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

film1 = Film.new({'title' => 'Amadeus', 'price' => 800})
film1.save()

film2 = Film.new({'title' => 'Brotherhood of the Wolf', 'price' => 1000})
film2.save()

film3 = Film.new({'title' => 'Charlie and the Chocolate Factory', 'price' => 1100})
film3.save()

film4 = Film.new({'title' => 'Dead Man', 'price' => 1200})
film4.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()

ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket2.save()

ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id})
ticket3.save()

ticket4 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})
ticket4.save()



binding.pry
nil
