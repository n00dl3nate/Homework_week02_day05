class Song

  attr_reader :name , :artist

  def initialize(name, artist)

    @name = name

    @artist = artist
  end

  def get_name_of_song
    return @name
  end

  def get_artist
    return @artist
  end




end
