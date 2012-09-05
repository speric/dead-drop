require './config/environment.rb'

gmail = Gmail.new(EMAIL_CONFIG['email'], EMAIL_CONFIG['password'])

gmail.inbox.emails.each do |email|
  IncomingMessage.create(:message_id => email.message_id, :message_body => email.parts[0].body.decoded)
  email.delete!
end

gmail.logout