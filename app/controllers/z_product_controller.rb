class ProductsController < ApplicationController
  
  
  configure do
    set :views, proc { File.join(root, '../views/') }
    enable :sessions
    set :session_secret, "password_security"
    
  end
  
    
    get "/products/home" do
      if Helpers.logged_in?(session[:user_id])
      @user = User.find(session[:user_id])
    else 
      @user = nil
        erb :"/products/home"
      
end
end

  post "/products/home" do
    if Helpers.logged_in?(session[:user_id])
      @user = User.find(session[:user_id])
    else
      @user = nil
    erb :"/products/home"
    
end
end



    get '/products' do

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



    get '/products/:id' do
#binding.pry
      @user = User.find(session[:user_id])
      @product = Product.find(params[:id])
     # @product_storage = ProductStorage.find(params[:id])
      erb :"products/show.html"
    end

  
    get "/products/:id/edit" do
     
      @user = User.find(session[:user_id])
      @product = Product.find(params[:id])
      erb :"products/edit"
     
    end
  
    patch "/products/:id" do
    
      @user = User.find(session[:user_id])
   #  if @product != nil
      @product = Product.find(params[:id])
  #    else
   # @product = Product.find(params[:id])
      @product.product_name = params['product_name']
    # @product_storage.product_name = params['product_name']
      @product.alloy = params['alloy']
     # @product_storage.product_name = params['alloy']
      @product.size = params['size']
     # @product_storage.size = params['size']
      @product.gemstone = params['gemstone']
     # @product_storage.gemstone = params['gemstone']
      @product.save
     # if @product_storage
       # redirect to "/products/#{@product_storage.id}"
    #  else
      redirect to "/products/#{@product.id}"
    end
 
    post '/products' do 
        @user = User.find(session[:user_id])
     if Helpers.input?(params[:product])
      @product = Product.new(params[:product]) 
     #@ps = ProductStorage.create(params[:product])
     @user.products << @product
      redirect "/products"  
     else
      redirect "/users/failure"
  end
end
end



