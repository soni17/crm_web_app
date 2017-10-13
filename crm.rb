require_relative 'contact'
require 'sinatra'

get '/' do
  redirect to('/contacts')
end

get '/contacts' do
    @allContacts = Contact.all()
  erb :contacts
end

get '/add-contact' do
  erb :addContact
end

get '/about' do
  erb :about
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
