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

end
