require("minitest/autorun")
require("minitest/rg")
require_relative("../songs.rb")


class SongTest < MiniTest::Test


  def setup

    @song1 = Song.new("Thriller","Micheal Jackson")

    @song2 = Song.new("Like a Prayer","Madonna")

    @song3 = Song.new("I Wanna Dance With Somebody","Whitney Houston")

    @song4 = Song.new("It’s Gonna Be Me","N Sync")

    @song5 = Song.new("Everybody","Backstreet Boys")

    @song6 = Song.new("Livin On A Prayer","Bon Jovi")

    @song7 = Song.new("Back In Black","ACDC")

    @song8 = Song.new("Africa","")

    @song9 = Song.new("Twist And Shout","Beatles")


  end

  def test_get_name_of_song
    result = @song4.get_name_of_song
    assert_equal("It’s Gonna Be Me", result)
  end

  def test_get_artist_of_song
    result = @song6.get_artist
    assert_equal("Bon Jovi", result)
  end
end
