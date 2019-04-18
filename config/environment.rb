require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'


require 'bundler/setup'
Bundler.require


ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "bd/artists.sqlite"
)

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS artists (
    id INTEGER PRIMARY KEY,
    name TEXT,
    genre TEXT,
    age INTEGER,
    hometown TEXT
  )
SQL

ActiveRecord::Base.connection.execute(sql)

require_relative "../artist.rb"
