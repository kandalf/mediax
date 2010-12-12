require './lib/dir_parser'

class MediaList < Sinatra::Base

  get '/' do
    @movies = DirParser.all

    haml :index
  end
end
