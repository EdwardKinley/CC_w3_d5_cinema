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

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return Ticket.map_items(tickets)
  end

  def self.map_items(data)
    return data.map{|datum| Ticket.new(datum)}
  end

end
