require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'uri'

class Bookmarks < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :homepage
  end

run! if app_file == $0

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmark
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end

end
