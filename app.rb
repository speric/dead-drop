class DeadDropApp < Sinatra::Base
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == [AUTHENTICATION['username'], AUTHENTICATION['password']]
  end
  
  get '/' do
    ActiveRecord::Base.connection.reconnect!
    @messages = IncomingMessage.all
    erb :index
  end

  get '/message/:id' do
    ActiveRecord::Base.connection.reconnect!
    @message = IncomingMessage.find(params[:id])
    erb :message
  end
end 
