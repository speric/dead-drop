require 'rubygems'
require './config/environment.rb'
require 'gmail'

gmail = Gmail.new(EMAIL_CONFIG['email'], EMAIL_CONFIG['password'])

gmail.inbox.emails.each do |email|
  if email.parts[0].nil?
    IncomingMessage.create(:message_id => email.message_id, :message_body => email.body)
  else
    IncomingMessage.create(:message_id => email.message_id, :message_body => email.parts[0].body.decoded)
  end
  email.delete!
end

gmail.logout
