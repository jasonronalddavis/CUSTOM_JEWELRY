
require "./config/environment"
class UsersController < Sinatra::Base
    
  
  set :views, proc { File.join(root, '../views/') }
  
    configure do
        enable :sessions
        set :session_secret, "BARNES"
      end
  


  get '/' do
    erb :'home_page/index'
  end

  

  

  get "users/signup" do
    erb :'signup'
  end

  post "users/signup" do
    user = User.new(username: params[:username], password: params[:password])
    if user.save
      redirect "users/login"
    else 
      redirect "users/failure"
    end
  end


  get '/users/account' do
    @user = User.find(session[:user_id])
    erb :'users/account'
  end

  get "/users/login" do
    erb :'users/login'
  end
  
  post "/users/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] =  user.id
      redirect "/account"
    else
      redirect "/failure"
    end
  end
  
  get "/failure" do
    erb :failure
  end

  get "/users/logout" do
    session.clear
    redirect "/"
  end


  get '/users/products' do
    @product = Product.all
  @users = User.all
    @curr_user = helpers.current_user(session)
      @user_products = UserProduct.find(params[:user_product])
      erb :'/products'
      erb :'users/index'
    end
    
      
      
    post '/users/products' do
      "test_message"
    #Product.create(params['product'])
  #redirect '/products'
      end
  #   redirect to "/users/products/#{@user_product.id}"      
  

  
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end