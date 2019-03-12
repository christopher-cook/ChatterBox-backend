class Chat

DB = PG.connectg({:host => "localhost", :port => 5432, :dbname => "final_dev"});

def self.all
  results = DB.exec(
    <<-SQL
      SELECT *
      FROM fuzzys;
    SQL
  )
  return results.map do |result|
      {
        "name" => result["name"],
        "age" => result["age"].to_i,
        "fav_color" => result["fav_color"]
      }
  end
 end
end
