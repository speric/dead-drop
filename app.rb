require 'sinatra'
require 'yaml'
require 'active_record'

DATABASE = YAML::load('config/database.yml')

ActiveRecord::Base.establish_connection(
  adapter: "mysql",
  host: DATABASE['host'],
  database: DATABASE['database'],
  username: DATABASE['username'],
  password: DATABASE['password']
)

class DeadDropApp < Sinatra::Base
  get '/' do
    erb :default
    # renders views/default.erb  
  end
end 