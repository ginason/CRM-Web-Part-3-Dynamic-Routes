require 'sinatra'
require_relative 'contact'

get '/' do
  redirect to('/contact')
end

get '/contact' do
  @contacts = Contact.all
  erb :contact
end


get '/contact/:id' do
  @contacts = Contact.find_by(id: params[:id].to_i)
  if @contacts
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end
