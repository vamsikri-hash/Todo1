  require_relative './config/environment'
# When I use tux:
# require './config/environment'
# Starting Application
use Rack::MethodOverride
run ApplicationController