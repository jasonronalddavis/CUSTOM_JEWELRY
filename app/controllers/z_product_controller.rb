class ProductsController < ApplicationController
  
  
  configure do
    set :views, proc { File.join(root, '../views/') }
    enable :sessions
    set :session_secret, "password_security"
  end
  
    
    get "/products/home" do
      
        erb :"/products/home"
  end


  post "/products/home" do
     
    erb :"/products/home"
end



    get '/products' do
    #  binding.pry
        @user = User.find(session[:user_id])
      @products = Product.all
      erb :'products/index'
  end

    get '/products/new' do
     # binding.pry
      @user = User.find(session[:user_id])
      @products = Product.all 
      @users = User.all
        @product_size = ["6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5"]
        erb :"products/new"
    end

  
    post '/products' do 
      
        @user = User.find(session[:user_id])
#binding.pry
      @product = Product.create(params[:product])
      
     if !params[:product].empty?
      @user.userproducts << @product
      redirect "/userproducts"  
     else
  puts "invalid input"
    sleep(5.seconds)
        redirect "/products"
     end
    end
  end


