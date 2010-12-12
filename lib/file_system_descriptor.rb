require 'yaml'
require 'erb'
require 'enumerator'

class FileSystemDescriptor
  include Enumerable

  @@settings = nil

  #def self.settings
    #@@settings ||= YAML::load(ERB.new(IO.read(File.join('config', 'config.yml'))).result)
  #end

end
