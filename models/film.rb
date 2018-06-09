require_relative('../db/sql_runner.rb')
require_relative('customer.rb')

class Film

  attr_reader(:id)
  attr_accessor(:title)

  def initialize(parameters)
    @id = parameters['id'].to_i if parameters['id']
    @title = parameters['title']
  end

  def save()
    sql = "INSERT INTO films (title) VALUES ($1) RETURNING id"
    values = [@title]
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
