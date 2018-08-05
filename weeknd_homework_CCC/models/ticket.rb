require_relative('../db/sql_runner')

class Ticket

  attr_accessor :id

  def initialize(options)

    @id = options['id'].to_i if options['id'] != nil
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i

  end

  def save()
    sql = "INSERT INTO tickets
    (
      movie_id,
      star_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@movie_id, @star_id,]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def ticket()
      sql = "SELECT * FROM tickets WHERE id = $1;"
      values = [@id]
      result = SqlRunner.run(sql, values)
      return Casting.new(result[0])
    end

    def update()
      sql = "UPDATE tickets
      SET movie_id = $1, star_id = $2
      WHERE id = $3;"
      values = [@movie_id, @star_id
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM tickets WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM tickets;"
      SqlRunner.run(sql)
    end



end
