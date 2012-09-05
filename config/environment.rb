require 'sinatra'
require 'sinatra/activerecord'
require 'yaml'
require 'erubis'
require './models/incoming_message'

DB_CONFIG      = YAML::load(File.open('config/database.yml'))
AUTHENTICATION = YAML::load(File.open('config/authentication.yml'))
EMAIL_CONFIG   = YAML::load(File.open('config/mail.yml'))

database_url = "mysql://#{DB_CONFIG['username']}:#{DB_CONFIG['password']}@#{DB_CONFIG['host']}:#{DB_CONFIG['port']}/#{DB_CONFIG['database']}"

set :database, database_url
set :erubis, :escape_html => true