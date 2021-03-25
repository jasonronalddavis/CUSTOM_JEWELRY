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
    # binding.pry
    params.inspect
      @products = Product.all 
      @product = Product.create(type: params['product']['type'], size: params['product']['size'], gemstone: params['product']['gemstone'])
     # if !params['product'].empty?
         #attribute : data cooresponding
      @product.save
      redirect "/products"
    end
  end