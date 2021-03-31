

class ApplicationController < Sinatra::Base
  
 
  configure do
    set :views, proc { File.join(root, '../views/') }
    enable :sessions
    set :session_secret, "password_security"
  end
  
 

  get '/' do
    erb :'products/home'
  end
end

  