require 'sinatra'
require 'sinatra/activerecord'
require 'yaml'
require 'erubis'
require './models/incoming_message'

DB_CONFIG = YAML::load(File.open('config/database.yml'))
AUTHENTICATION = YAML::load(File.open('config/authentication.yml'))

database_url = "mysql://#{DB_CONFIG['username']}:#{DB_CONFIG['password']}@#{DB_CONFIG['host']}:#{DB_CONFIG['port']}/#{DB_CONFIG['database']}"

set :database, database_url
set :erubis, :escape_html => true

class DeadDropApp < Sinatra::Base
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == [AUTHENTICATION['username'], AUTHENTICATION['password']]
  end
  
  get '/' do
  	@messages = IncomingMessage.all
    erubis  :index
  end

  get '/message/:message_id' do
    @message = IncomingMessage.find(params[:message_id])
    erubis  :message
  end
end 