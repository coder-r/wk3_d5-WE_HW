require_relative('../db/sql_runner')



class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)

    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
    @funds = options['funds'].to_i

  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      funds
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @funds]
    result = SqlRunner.run( sql, values )
    @id = result[0]['id'].to_i
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return Star.new(result.first)
  end

  def update()
    sql = "UPDATE customers
    SET name = $1, funds = $2
    WHERE id = $3;"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)


  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def find_cust_booked()
    sql = "SELECT films.*
    FROM customers
    INNER JOIN tickets
    ON films.id = tickets.movie_id
    WHERE tickets.customer_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |film_hash| Film.new(movie_hash)}
  end

  # THIS METHOD SHOWS WHICH FILM A CUSTOMER HAS BOOKED TO SEE



end
