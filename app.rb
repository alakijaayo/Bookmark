require 'sinatra/base'

class Bookmark < Sinatra::Base
  get '/' do
    erb :bookmark
  end
end
