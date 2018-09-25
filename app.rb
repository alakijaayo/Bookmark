require 'sinatra/base'
require './lib/bookmark'

class Bookmarks < Sinatra::Base
  get '/' do
    erb :homepage
  end

run! if app_file == $0

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmark
  end


end
