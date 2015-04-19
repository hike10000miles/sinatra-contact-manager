require 'sinatra'
require_relative 'contact'

get "/" do
  @contacts = Contact.all
  erb :index
end

get "/new" do
  erb :new
end

post "/create" do
  Contact.new(params[:first_name], params[:last_name])
  redirect "/"
end

get "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  erb :show
end

get "/contacts/:id/edit" do
  @contact = Contact.find(params[:id].to_i)
  erb :edit
end

patch "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  @contact.first_name = params[:first_name]
  @contact.last_name = params[:last_name]
  redirect "/"
end

delete "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  Contact.all.delete(@contact)
  redirect "/"
end