class ProductsController < UsersController
  
  
  set :views, proc { File.join(root, '../views/') }
  
  configure do
      enable :sessions
      set :session_secret, "BARNES"
    end


    get '/products' do
      @products = Product.all
      erb :'products/index'
    end



    get '/products/new' do
      @products = Product.all 
      @users = User.all
        @product_size = ["6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5"]
        erb :"products/new"
    end

    post '/products' do 
      @products = Product.all 
      @product = Product.create
     # if !params['product'].empty?
         #attribute : data cooresponding
      Product.all << @product
      redirect "/products"
    end
  
    get '/products/:id' do
      @product_id = Product.find(params[:id])
      erb :"users/show"
    end
  end