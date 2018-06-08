require_relative('../db/sql_runner.rb')
require_relative('customer.rb')

class Film

  attr_reader(:id)
  attr_accessor(:title, :price)

  def initialize(parameters)
    @id = parameters['id'].to_i if parameters['id']
    @title = parameters['title']
    @price = parameters['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def retitle(new_title)
    @title = new_title
    sql = "UPDATE films SET title = $1 WHERE id = $2"
    values = [@title, @id]
    SqlRunner.run(sql, values)
  end

  def reprice_to(new_price)
    @price = new_price
    sql = "UPDATE films SET price = $1 WHERE id = $2"
    values = [@price, @id]
    SqlRunner.run(sql, values)
  end

  def reprice_by(adjustment)
    @price += adjustment
    sql = "UPDATE films SET price = $1 WHERE id = $2"
    values = [@price, @id]
    SqlRunner.run(sql, values)
  end

  def reprice_multiple(multiplier)
    @price = (@price*multiplier).to_i
    sql = "UPDATE films SET price = $1 WHERE id = $2"
    values = [@price, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return Film.map_items(films)
  end

  def self.map_items(data)
    return data.map{|datum| Film.new(datum)}
  end

end
