  require_relative './config/environment'
# When I use tux:

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
# require './config/environment'
# Starting Application
use Rack::MethodOverride
run ApplicationController