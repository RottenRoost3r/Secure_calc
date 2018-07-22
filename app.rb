require 'sinatra'
require_relative 'calc.rb'

enable :sessions

get '/' do
  erb :login, locals:{error: ""}
end

post '/log' do
  username = params[:username]
  password = params[:password]
  user1 = "admin"
  user2 = "student"
  user3 = "jordan"
  pass1 = "admin"
  pass2 = "minedminds"
  pass3 = "endicott"

  if username == user1 && password == pass1
    redirect '/calc'
  elsif username == user2 && password == pass2
    redirect '/calc'
  elsif username == user3 && password == pass3
    redirect '/calc'
  elsif username != user1 && username != user2 && username != user3 && password != pass1 && password != pass2 && password != pass3
		
		error = "Inavlid Username and Password"
		erb :login, locals:{error: "Inavlid Username and Password"}

  elsif username != user1 && username != user2 && username != user3
     
		error = "Invalid Username"
    erb :login, locals:{error: "Inavlid Username"}
    
  elsif password != pass1 && password != pass2 && password != pass3
    
		error = "Inavlid Password"
    erb :login, locals:{error: "Invalid Password"}

  end
end

get "/calc" do

  val1 = session[:val1] || ""
  val2 = session[:val2] || ""
  operation = session[:operation] || ""
	result = session[:result] || false
  erb :calc, locals:{result: result, val1: val1, val2: val2, operation: operation}

end

post '/calculate' do
  
end