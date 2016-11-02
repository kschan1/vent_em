require 'sinatra'
require 'sinatra/reloader'
require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/vent'
require 'pry'

enable :sessions

helpers do

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end

get '/' do
  @vents = Vent.all
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    # if user and password matches, create session
    session[:user_id] = user.id
    redirect '/'
  else
    # if incorrect, go back to login page
    redirect to '/login'
  end
end

delete '/login' do
  session[:user_id] = nil
  redirect to '/login'
end

post '/' do
  vent = Vent.new(body: params[:vent_body], user_id: current_user.id, creation_date_time: Time.now)
  vent.save
  redirect to '/'
end
