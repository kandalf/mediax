require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

require './mediax'

set :haml, :format => :html5
run Mediax
