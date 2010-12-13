require 'yaml'

class Settings
  @@settings = nil

  def self.load(file)
    @@settings = YAML::load_file(file)
  end
  
  def initialize(file = "config/mediax.yml")
    self.load(file)
  end

  def method_missing(name, *args, &block)
    self.settings[name.to_s]
  end

  def self.settings
    @@settings ||= self.load("config/mediax.yml")
  end

end
