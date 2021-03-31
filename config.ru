#$LOAD_PATH.unshift '.'
require_relative './config/environment'


if ActiveRecord::Migrator.needs_migration?
    raise "Migrations are pending. Run rake db:migrate to resolve the issue"
end


#use Rack::MethodOverrides
use UsersController
use ProductsController
use SessionsController
run ApplicationController

