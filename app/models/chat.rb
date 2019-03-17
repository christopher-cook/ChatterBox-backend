class Chat

DB = PG.connect({:host => "*", :port => 5432, :dbname => "final_dev"})
DB = PG.connect({:host => "localhost", :port => 5432, :dbname => "final_dev"})
def self.all
  results = DB.exec(
    <<-SQL
      SELECT *
      FROM chatter;
    SQL
  )
  return results.map do |result|
      {
        "name" => result["name"],
        "feed" => result["feed"],
        "id" => result["id"].to_i
      }
  end#map
end#all

def self.find(id)
  results = DB.exec(
    <<-SQL
    SELECT *
    FROM chatter
    WHERE id=#{id};
    SQL
  )
  return {
    "name" => results.first["name"],
    "feed" => results.first["feed"]
  }
end#find

def self.create(opts)
  results = DB.exec(
    <<-SQL
      INSERT INTO chatter (name, feed)
      VALUES ('#{opts["name"]}', '#{opts["feed"]}')
      RETURNING id, name, feed;
    SQL
  )
  return {
    "name" => results.first["name"],
    "feed" => results.first["feed"]
  }
end#create

def self.delete(id)
  results = DB.exec("DELETE FROM chatter WHERE id=#{id};")
  return { "successfully deleted" => true }
end#delete

def self.update(id, opts)
  results = DB.exec(
    <<-SQL
      UPDATE chatter
      SET name='#{opts["name"]}', feed='#{opts["feed"]}'
      WHERE id=#{id}
      RETURNING name, feed;
    SQL
  )
  return {
    "id" => results.first["id"].to_i,
    "name" => results.first["name"],
    "feed" => results.first["feed"]
  }
end#update

end#class
