#require 'bundler'
#Bundler.setup

require 'sinatra'
require './lib/dir_parser'
require 'haml'
require 'uri'

set :haml, :format => :html5

get '/' do
  @movies = DirParser.all

  haml :index
end
