require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'rack-flash'
require './models'


set :database, "sqllite3.wed_db.sqllite3"

get '/' do
	@user = User.all
	erb	:home
end


get '/signup' do
	erb	:signup
end


post '/signup' do
	user = User.new(params[:attribute, :attribute, :attribute])
	if user.save
		redirect '/home'
	else
		redirect '/signup' #or maybe an error try again alert
	end






post '/sign-in' do
	@user = User.where(username: params[:username]).first
		if @user.password == params[:password]
			redirect '/'
		else
			redirect '/login-failed'
		end
end

# get '/login-failed' do
# 	"Incorrect log-in. Please retry."
# end

