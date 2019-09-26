 require './config/environment'
 require "rubygems"
 require "sinatra"

 class ApplicationController < Sinatra::Base


#enabling sessions 
 configure do 
  # set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
 end
 

get "/" do
  @todos =Post.all
  @message=session.delete(:message)
  erb :todos
end

get "/:id" do
  @todo = Post.find(params[:id].to_i)
  erb :todo
end

post "/" do

  @todo=Post.create(title:params[:title],date:params[:date])
  session[:message]="sucessfully added todo:#{params[:title]}"

redirect "/"
end

put "/:id" do
  @todo=Post.find(params[:id].to_i)
  @todo.update(title:params[:title])
  @todo.update(date:params[:date])
  @todo.save
  redirect "/"
end

delete "/:id" do
  @todo=Post.find(params[:id].to_i)
  @todo.delete
  redirect "/"
end

end
 
