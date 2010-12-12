require 'mini_magick'

class DirParser
  EXCLUDE_DIRS  = %w". .."
  MOVIES_DIR    = "/mnt/darkstar/movies"
  THUMBS_DIR    = "./public/thumbs"
  THUMBS_WIDHT  = 100
  THUMBS_HEIGHT = 150


  def self.all
    movies = []
    (Dir.entries(MOVIES_DIR) - EXCLUDE_DIRS).sort.each do |entry|
      movie = {}
      movie[:name] = entry
      movie[:cover] = self.create_thumbnail_for entry
      movies << movie
    end
    movies
  end

  private
  def self.create_thumbnail_for(movie_name)
    thumb_file = "#{THUMBS_DIR}/#{movie_name}.png".gsub(/\s|\(|\)|\{|\}|\[|\]/, "_").downcase
    thumb = `ls #{thumb_file}`
    movie_dir = "#{MOVIES_DIR}/#{movie_name}/"
    cover_file = Dir.entries(movie_dir).find {|e| e.match /cover/} 

    if thumb.empty? and not cover_file.nil?
      image = MiniMagick::Image.read(File.read("#{movie_dir}/#{cover_file}"))
      image.resize "#{THUMBS_WIDHT}x#{THUMBS_HEIGHT}"
      image.format "png"
      image.write thumb_file
    end

    thumb_file.gsub(/\/public/, "")
  end
end
