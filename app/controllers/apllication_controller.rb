 require './config/environment'
 require "rubygems"
 require "sinatra"

 class ApplicationController < Sinatra::Base


#enabling sessions 
 configure do 
   set :publi_folder, 'public'
  set :views, 'app/views'
  enable :sessions
 end
 

get "/todos" do
  @todos =Post.all
  @message=session.delete(:message)
  erb :todos
end

get "/todos/:id" do
  @todo = Post.find(params[:id].to_i)
  erb :todo
end

post "/todos" do

  @todo=Post.create(title:params[:title],date:params[:date])
  session[:message]="sucessfully added todo:#{params[:title]}"

redirect "/todos"
end

put "/todos/:id" do
  @todo=Post.find(params[:id].to_i)
  @todo.update(title:params[:title])
  @todo.update(date:params[:date])
  @todo.save
  redirect "/todos"
end

delete "/todos/:id" do
  @todo=Post.find(params[:id].to_i)
  @todo.delete
  redirect "/todos"
end

end
 
