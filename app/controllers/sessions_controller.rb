class SessionsController < UsersController

    
    
    
    
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