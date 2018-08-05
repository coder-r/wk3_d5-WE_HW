require_relative("models/film.rb")
require_relative("models/customer.rb")
require_relative("models/ticket.rb")

require( 'pry-byebug' )


# Ticket.delete_all()
# Customer.delete_all()
# Film.delete_all()

customer1 = Customer.new({ 'name' => 'Rameez', 'funds' => '20'} )
customer1.save()
customer2 = Customer.new({ 'name' => 'Sithara', 'funds' => '25'} )
customer2.save()
customer3 = Customer.new({ 'name' => 'Jane', 'funds' => '30'} )
customer3.save()
customer4 = Customer.new({ 'name' => 'Tanny', 'funds' => '50'} )
customer4.save()


film1 = Film.new({ 'title' => 'Avengers', 'price' => '12'} )
film1.save()
film2 = Film.new({ 'title' => 'Teen Titans', 'price' => '10'} )
film2.save()
film3 = Film.new({ 'title' => 'Ant-Man', 'price' => '15'} )
film3.save()
film4 = Film.new({ 'title' => 'Mission Impossible', 'price' => '18'} )
film4.save()


ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()
ticket3 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film3.id})
ticket3.save()
ticket4 = Ticket.new({ 'customer_id' => customer4.id, 'film_id' => film4.id})
ticket4.save()


binding.pry
nil
