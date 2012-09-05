class IncomingMessage < ActiveRecord::Base
  validates_presence_of :message_body
end