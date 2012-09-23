require 'rubygems'
require './config/environment.rb'
require 'gmail'

gmail = Gmail.new(EMAIL_CONFIG['email'], EMAIL_CONFIG['password'])

gmail.inbox.emails.each do |email|
  message_body = email.parts[0].nil? ? email.body : email.parts[0].body.decoded
  IncomingMessage.create(:message_body => message_body)
  email.delete!
end

gmail.logout
