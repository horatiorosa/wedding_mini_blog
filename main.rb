require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'rack-flash'
require './models'
enable	:sessions


set :database, "sqlite3:exercise.sqlite3"
set :sessions, true
use Rack::Flash, sweep: true

# def current_user
# 	if session[:user_id]
# 		@current_user = User.find(session[:user_id])
# 	end
# end


def current_user
	session[:user_id] ? User.find(session[:user_id]) : nil
end


get '/' do 
	erb :welcome
end

get '/home' do
	@posts = Post.all
	erb	:home
end



get '/register' do
	erb	:register
end


post '/register' do
	@user = User.create(username: params[:username], password: params[:password], fname: params[:fname], lname: params[:lname],email: params[:email])
	my_user = User.find_by(username: params[:username])
	session[:user_id] = my_user.id
		redirect '/home' 
	end


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
			redirect '/login'
		end
end

post '/delete' do
	@user = User.where(username: params[:username]).last
	 flash[:alert] = 'record will be deleted'
	 User.delete
end 

get '/logout' do
  session.clear
  redirect '/'
  flash[:notice] = "you have successfully logged out"
end

get '/posts' do
	erb :posts
end

post '/posts' do
	Post.create(title: params[:title], posts: params[:posts], user_id: current_user.id)
	redirect to('/home')
end

