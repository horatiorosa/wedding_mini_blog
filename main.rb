require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'rack-flash'
require './models'
enable	:sessions


set :database, "sqlite3:exercise.sqlite3"
set :sessions, true
use Rack::Flash, sweep: true


get '/' do 
	erb :welcome
end

get '/home' do
	erb	:home
end

post '/delete' do
	@user = User.where(username: params[:username]).last
	 flash[:alert] = 'record will be deleted'
	 User.delete
end 

get '/register' do
	erb	:register
end


post '/register' do
	@user = User.create(username: params[:username], password: params[:password] )
	if @user.save
		redirect '/home'  #i want to redirect to the profile page
	else
		redirect '/register' #or maybe an ERROR TRY AGAIN alert
	end
end

# post '/user' do
# 	@user = User.create(fname: params[:fname], lname: params[:lname],email: params[:email] )
# 	if @user.save
# 		redirect '/home'
# 	# else
	# 	redirect '/sign_up' #or maybe an ERROR TRY AGAIN alert
# 	end
# end

get '/login' do
	erb	:login
end


post '/login' do
	@user = User.where(username: params[:username]).last
		if @user and @user.password == params[:password]
			session[:user_id] = @user.id
			flash[:notice] = "You have successfully logged in"
			redirect '/home'  
		else
			flash[:alert] = "There was a problem signing you in. Please try again."
		end
		redirect '/home'
end

# get '/login-failed' do
# 	"Incorrect log-in. Please retry."
# end

def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
	end
end

