require 'sinatra'
require 'sinatra/reloader'
require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/vent'
require_relative 'models/vent_type'
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
  @vent_types = VentType.order(id: :asc)
  if params[:vent_type_id]
    @vents = Vent.order(id: :desc).where(vent_type_id: params[:vent_type_id])
  else
    @vents = Vent.order(id: :desc)
  end
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
  vent = Vent.new(body: params[:vent_body], user_id: current_user.id, creation_date_time: Time.now, vent_type_id: params[:vent_type_id])
  vent.save
  redirect to '/'
end

get '/create_user' do
  erb :create_user
end

post '/create_user' do
  user = User.new(email: params[:email], username: params[:username], password: params[:password])
  if user.save
    redirect to '/'
  else
    erb :create_user
  end
end

get '/:id' do
  @vent = Vent.find(params[:id])
  @vent_types = VentType.all
  erb :show_vent
end

get '/edit_vent/:id' do
  @vent = Vent.find(params[:id])
  redirect to '/' unless current_user.id == @vent.user.id
  @vent_types = VentType.all
  erb :edit_vent
end

put '/:id' do
  vent = Vent.find(params[:id])
  vent.update(body: params[:vent_body], vent_type_id: params[:vent_type_id])
  redirect to '/'
end
