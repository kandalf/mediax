require 'rubygems'
require 'sinatra'
require 'haml'

require './media_list'

set :haml, :format => :html5
run MediaList
