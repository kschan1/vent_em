require 'sinatra'
require 'sinatra/reloader'
require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/vent'
require 'pry'

enable :sessions


get '/' do
  @vents = Vent.all
  erb :index
end
