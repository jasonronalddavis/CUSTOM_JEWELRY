require 'rack-flash'
require "./config/environment"
class UsersController < ApplicationController


    
    use Rack::Flash
  
    configure do
        set :views, proc { File.join(root, '../views/') }
        enable :sessions
        set :session_secret, "password_security"
      end
      



    

      get '/users/signup' do 
        erb :'/users/signup'
      end

    
      post "/users/signup" do
       # binding.pry
       user = User.new(username: params[:username], password: params[:password])
        if user.save
          redirect "/users/login"
        else 
          redirect "/users/failure"
        end
      end

      
      get "/userproducts" do
        
    binding.pry
        @user = User.find(session[:user_id])
		erb :"/users/users_products"
		end


        get "/users/login" do
            erb :'users/login'
          end

           
      post "/users/login" do
        @barnes = 2
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          @barnes += 1
        #  binding.pry
          redirect "/userproducts"
        else
          redirect "/users/failure"
        end
      end

      get "/users/failure" do
        erb :"/users/failure"
      end
  

  get "/users/logout" do
    session.clear
    redirect to "/products/home"
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

  get '/user_product/:slug/edit' do
    @user_product = Product.find_by_slug(params[:slug])
    erb :"/products/edit"
  end

  patch '/user_product/:slug' do
    @user_product = Product.find_by_slug(params[:slug])
    @@user_product.update(params[:product])
    @user_product.save
    flash[:message] = "Successfully updated product."
    redirect to "/userproducts/#{@user_product.slug}"
  end

end

