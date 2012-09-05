class DeadDropApp < Sinatra::Base
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == [AUTHENTICATION['username'], AUTHENTICATION['password']]
  end
  
  get '/' do
  	@messages = IncomingMessage.all
    erubis  :index
  end

  get '/message/:id' do
    @message = IncomingMessage.find(params[:id])
    erubis  :message
  end
end 