require 'sinatra'
require 'sinatra/activerecord'
require 'yaml'

require './models/incoming_message'

DB_CONFIG = YAML::load(File.open('config/database.yml'))

database_url = "mysql://#{DB_CONFIG['username']}:#{DB_CONFIG['password']}@#{DB_CONFIG['host']}:#{DB_CONFIG['port']}/#{DB_CONFIG['database']}"

set :database, database_url

class DeadDropApp < Sinatra::Base
  get '/' do
  	@messages = IncomingMessage.all
    erb :index
  end
end 