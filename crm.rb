require_relative 'contact'
require 'sinatra'

get '/' do
  @allContacts = Contact.all()
  erb :index
end

get '/add-contact' do
  erb :addContact
end

get '/about' do
  erb :about
end


after do
  ActiveRecord::Base.connection.close
end

#completed part 1
