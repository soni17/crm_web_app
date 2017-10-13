require_relative 'contact'
require 'sinatra'

get '/' do
  redirect to('/contacts')
end

get '/about' do
  erb :about
end

get '/contacts' do
    @allContacts = Contact.all()
  erb :contacts
end

post '/contacts' do
  Contact.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    note: params[:note]
  )
  redirect to('/contacts')
end

get '/contacts/new' do
  erb :new
end

get '/contacts/:id' do
  id = params[:id].to_i
  @contact = Contact.find_by(id: id)

  if @contact
    erb :show_contact
  else
    erb :not_found
  end

end


after do
  ActiveRecord::Base.connection.close
end
