require 'sinatra'
require_relative 'calc.rb'

enable :sessions

get '/' do
  erb :login
end

post '/log' do
   
end