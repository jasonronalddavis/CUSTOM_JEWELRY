

class ApplicationController < Sinatra::Base
  
 
  configure do
    set :views, proc { File.join(root, '../views/') }
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "password_security"
  end
  
 

  get '/' do
    if Helpers.logged_in?(session)
      @user = User.find(session[:user_id])
    else
      @user = nil
    end
    erb :'products/home'

end


helpers do
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end
end
end
