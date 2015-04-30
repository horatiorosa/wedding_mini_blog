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
