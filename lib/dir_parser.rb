require 'mini_magick'
require './lib/settings'

class DirParser
  
  Settings.load("config/mediax.yml")

  EXCLUDE_DIRS  = %w". .."
  MEDIA_DIR     = Settings.settings["media"]["dir"]
  THUMBS_DIR    = Settings.settings["thumbs"]["dir"]
  THUMBS_WIDHT  = Settings.settings["thumbs"]["width"]
  THUMBS_HEIGHT = Settings.settings["thumbs"]["height"]


  def self.all
    media = []
    (Dir.entries(MEDIA_DIR) - EXCLUDE_DIRS).sort.each do |entry|
      media_entry = {}
      media_entry[:name] = entry
      media_entry[:cover] = self.create_thumbnail_for entry
      media << media_entry
    end
    media
  end

  private
  def self.create_thumbnail_for(media_name)
    thumb_file = "#{THUMBS_DIR}/#{media_name}.png".gsub(/\s|\(|\)|\{|\}|\[|\]/, "_").downcase
    thumb = `ls #{thumb_file}`
    entry_dir = "#{MEDIA_DIR}/#{media_name}/"
    cover_file = Dir.entries(entry_dir).find {|e| e.match /cover/} 

    if thumb.empty? and not cover_file.nil?
      image = MiniMagick::Image.read(File.read("#{entry_dir}/#{cover_file}"))
      image.resize "#{THUMBS_WIDHT}x#{THUMBS_HEIGHT}"
      image.format "png"
      image.write thumb_file
    end

    thumb_file.gsub(/public\//, "")
  end
end
