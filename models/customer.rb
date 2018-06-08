require_relative('../db/sql_runner.rb')
require_relative('ticket.rb')

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
