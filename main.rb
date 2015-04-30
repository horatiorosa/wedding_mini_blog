require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'rack-flash'
require './models'


set :database, "sqllite3.wed_db.sqllite3"

get '/' do
	erb	:home
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