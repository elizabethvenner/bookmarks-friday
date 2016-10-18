require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    title = params[:title]
    url = params[:url]
    Link.create(url: url, title: title)
    redirect to '/links'
  end

  run! if app_file == $0
end
