require 'sinatra'
require_relative 'calc.rb'

enable :sessions

get '/' do
  name = params[:name]
  lastname = params[:lastname]
  erb :login, locals:{error: "", name: name, lastname: lastname}
end

post '/log' do
  name = params[:name]
  lastname = params[:lastname]
  username = params[:username]
  password = params[:password]

  session[:name] = name
  session[:lastname] = lastname
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
  erb :calc, locals:{name: name, lastname: lastname}
end

get "/calc" do
  name = session[:name]
  lastname = session[:lastname]
  val1 = session[:val1] || ""
  val2 = session[:val2] || ""
  operation = session[:operation] || ""
	result = session[:result] || false
  erb :calc, locals:{result: result, val1: val1, val2: val2, operation: operation, name: name, lastname:lastname}
end

post '/calculate' do
  session[:val1] = params[:val1]
  session[:val2] = params[:val2]
    
  case params[:operation]
  when "add"
    session[:operation] = "+"
  when "subtract"
    session[:operation] = "-"
  when "multiply"
    session[:operation] = "*"
  when "divide"
    session[:operation] = "/"
  end

  session[:result] = work(params[:operation], params[:val1], params[:val2])
  redirect '/calc'
end