require './lib/dir_parser'

class MediaList < Sinatra::Base

  get '/' do
    @media_entries = DirParser.all

    haml :index
  end
end
