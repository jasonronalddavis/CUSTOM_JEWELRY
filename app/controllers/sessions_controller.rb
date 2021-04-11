class SessionsController < ApplicationController

    configure do
        set :views, proc { File.join(root, '../views/') }
        enable :sessions
        set :session_secret, "password_security"
       
      end
    
    
    
    get 'login' do
    
        erb :'sessions/login.html'
    end
    
    post '/sessions' do
        login(params[:email], params[:password])
       redirect '/products'
    end
    
    get '/logout' do
    logout!
    redirect '/products'
    end
    end