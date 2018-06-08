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

end
