require_relative('../db/sql_runner.rb')
require_relative('ticket.rb')
require_relative('screening.rb')

class Customer

  attr_reader(:id)
  attr_accessor(:name, :funds)

  def initialize(parameters)
    @id = parameters['id'].to_i if parameters['id']
    @name = parameters['name']
    @funds = parameters['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def rename(new_name)
    @name = new_name
    sql = "UPDATE customers SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def adjust_funds_to(new_total)
    @funds = new_total
    sql = "UPDATE customers SET funds = $1 WHERE id = $2"
    values = [@funds, @id]
    SqlRunner.run(sql, values)
  end

  def adjust_funds_by(adjustment)
    @funds += adjustment
    sql = "UPDATE customers SET funds = $1 WHERE id = $2"
    values = [@funds, @id]
    SqlRunner.run(sql, values)
  end

  def screenings()
    sql = "SELECT screenings.* FROM screenings INNER JOIN tickets ON tickets.screening_id = screenings.id WHERE customer_id = $1;"
    values = [@id]
    screenings = SqlRunner.run(sql, values)
    return Screening.map_items(screenings)
  end

  def too_broke_to_see_screening?(screening)
    return @funds < screening.price
  end

  def buy_ticket(screening)
    return 'Sold out!' if screening.sold_out?()
    return 'Insufficient funds!' if self.too_broke_to_see_screening?(screening)
    self.adjust_funds_by(-screening.price)
    ticket = Ticket.new({'customer_id' => @id, 'screening_id' => screening.id})
    ticket.save()
    screening.reduce_vacant_seats_by_one()
    return ticket
  end

  def count_tickets()
    sql = "SELECT screenings.* FROM screenings INNER JOIN tickets ON tickets.screening_id = screenings.id WHERE customer_id = $1;"
    values = [@id]
    screenings = SqlRunner.run(sql, values)
    return Screening.map_items(screenings).count
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return Customer.map_items(customers)
  end

  def self.map_items(data)
    return data.map{|datum| Customer.new(datum)}
  end

end
