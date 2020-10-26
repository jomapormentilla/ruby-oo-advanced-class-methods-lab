class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name( name )
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name( name )
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name( name )
    self.all.find{ |song|
      song.name == name
    }
  end

  def self.find_or_create_by_name( name )    
    if find_by_name( name ) != nil
      find_by_name( name )
    else
      create_by_name( name )
    end
  end

  def self.alphabetical
    # Cool, you can sort by attribute!
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename( string )
    song = self.new
    arr = string.split(/[-||.]/)
    song.name = arr[1].strip
    song.artist_name = arr[0].strip
    self.all << song
    song
  end

  def self.create_from_filename( string )
    song = new_from_filename( string )
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end
end