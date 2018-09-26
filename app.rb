require 'sinatra/base'
require './lib/bookmark'

class Bookmarks < Sinatra::Base
  get '/' do
    erb :homepage
  end

run! if app_file == $0

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmark.all
    erb :bookmark
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end

end
