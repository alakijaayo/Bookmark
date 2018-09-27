require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'

class Bookmarks < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    flash[:notice] = "Hooray, flash is working!"
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
    Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end

end
