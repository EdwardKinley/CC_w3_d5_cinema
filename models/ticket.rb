require_relative('../db/sql_runner.rb')
require_relative('film.rb')
require_relative('customer.rb')

class Ticket

  attr_reader(:id)
  attr_accessor(:customer_id, :film_id)

  def initialize(parameters)
    @id = parameters['id'].to_i if parameters['id']
    @customer_id = parameters['customer_id'].to_i
    @film_id = parameters['film_id'].to_i
  end

end
