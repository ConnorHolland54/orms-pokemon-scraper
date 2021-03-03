class Pokemon
    attr_accessor :name, :type, :id, :db

    def initialize(id:, name:, type:, db:)
        @name = name
        @type = type
        @id = id
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(num, db) 
        sql = <<-SQL
        SELECT * FROM pokemon WHERE id = ?
        SQL
        db.execute(sql, num). each do |row|

            return new_pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
        end.first
    end

end
