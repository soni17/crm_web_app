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

get '/contacts/new' do
  erb :new_contact
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

get '/contacts/:id' do
  id = params[:id].to_i
  @contact = Contact.find_by(id: id)

  if @contact
    erb :show_contact
  else
    erb :not_found
  end

end

get '/contacts/:id/edit' do
  id = params[:id].to_i
  @contact = Contact.find_by(id: id)

  if @contact
    erb :edit_contact
  else
    erb :not_found
  end
end

put '/contacts/:id' do

  id = params[:id].to_i
  @contact = Contact.find_by(id: id)
  if @contact
    @contact.update(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    note: params[:note]
    )

    redirect to ('/contacts')
  else
    raise Sinatra::NotFound
  end

end


after do
  ActiveRecord::Base.connection.close
end
