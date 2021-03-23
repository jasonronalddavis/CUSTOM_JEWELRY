class ProductsController < UsersController
  set :views, proc { File.join(root, '../views/') }
  
  configure do
      enable :sessions
      set :session_secret, "BARNES"
    end


    get '/products' do
      @product = Product.all 
      erb :'products/index'
    end
  
    get '/products/new' do
        @product_size = ["6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5"]
        erb :"products/new"
    end
  
    get '/products/:id' do
      @product = Product.find(params[:id])
      erb :"products/show"
    end
  
    get '/products/:id/edit' do
        
     @product = Product.find(params[:id])
      erb :"products/edit"
    end


  
      patch '/products/:id' do
        @product = Product.find_by_id(params[:id])
        @product.update(params[:product])
        unless params[:title][:name].empty?
          @product.titles << Title.create(params[:title])
        end
        unless params[:landmark][:name].empty?
          @product.landmarks << Landmark.create(params[:landmark])
        end
        @product.save
        redirect to "/products/#{@product.id}"
      end
  end