require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'rack-flash'
require './models'

set :database, "sqlite3:exercise.sqlite3"
set :sessions, true
use Rack::Flash, sweep: true


get '/' do 
	erb :welcome
end



get '/signup' do
	erb	:signup
end


post '/signup' do
	@user = User.new(params[:user])
	if user.save
		redirect '/home'
	else
		redirect '/signup' #or maybe an error try again alert
	end
end






# post '/sign-in' do
# 	@user = User.where(username: params[:username]).first
# 		if @user.password == params[:password]
# 			redirect '/'
# 		else
# 			redirect '/login-failed'
# 		end
# end

# get '/login-failed' do
# 	"Incorrect log-in. Please retry."
# end


