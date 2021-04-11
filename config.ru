#$LOAD_PATH.unshift '.'
require './config/environment'
require 'rack'

use Rack::Static, urls: ['/css'], root: 'public' # Rack fix allows seeing the css folder.

if ActiveRecord::Migrator.needs_migration?
    raise "Migrations are pending. Run rake db:migrate to resolve the issue"
end


use Rack::MethodOverride
use UsersController
use ProductsController
use SessionsController
run ApplicationController

