require 'bundler/setup'
Bundler.require

ENV['SINATRA_ENV'] ||= "development"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/jewelry#{ENV['SINATRA_ENV']}.sqlite"
)


require_relative '../app/controllers/application_controller'
require_all 'app'

#Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
#Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].sort.each {|f| require f}
