require_relative('../db/sql_runner')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)

    @id = options['id'].to_i if options['id'] != nil
    @title = options['title']
    @price = options[''].to_i

  end

  def save()
    sql = "INSERT INTO films
    (
      title,
      price
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @price]
    result = SqlRunner.run(sql,values)
    # result = [{'id' => 57}]
    @id = result[0]['id'].to_i

  end

  def update()
    sql = "UPDATE films
    SET title = $1, price = $2
    WHERE id = $3;"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

  def stars()
  sql = "SELECT stars.*
  FROM stars
  INNER JOIN castings
  ON stars.id = castings.star_id
  WHERE castings.movie_id = $1"
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map { |star_hash| Stars.new(star_hash) }
  end

end
