require_relative('../db/sql_runner.rb')
require_relative('ticket.rb')

class Screening

  attr_reader(:id)
  attr_accessor(:film_id, :time, :capacity)

  def initialize(parameters)
    @id = parameters['id'].to_i
    @film_id = parameters['film_id'].to_i
    @time = parameters['time']
    @capacity = parameters['capacity']
  end

  def save()
    sql = "INSERT INTO screenings (film_id, time, capacity) VALUES ($1, $2, $3) RETURNING id"
    values = [@film_id, @time, @capacity]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def re_film(new_film_id)
    @film_id = new_film_id
    sql = "UPDATE screenings SET film_id = $1 WHERE id = $2"
    values = [@film_id, @id]
    SqlRunner.run(sql, values)
  end

  def re_time(new_time)
    @time = new_time
    sql = "UPDATE screenings SET time = $1 WHERE id = $2"
    values = [@time, @id]
    SqlRunner.run(sql, values)
  end

  def re_capacity(new_capacity)
    @capacity = new_capacity
    sql = "UPDATE screenings SET capacity = $1 WHERE id = $2"
    values = [@capacity, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    screenings = SqlRunner.run(sql)
    return Screening.map_items(screenings)
  end

  def self.map_items(data)
    return data.map{|datum| Screening.new(datum)}
  end

end
