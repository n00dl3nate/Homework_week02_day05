require("minitest/autorun")
require("minitest/rg")
require('pry')
require_relative("../room.rb")
require_relative("../songs.rb")
require_relative("../guest.rb")
require_relative("../drinks.rb")


class RoomsTest < MiniTest::Test


  def setup



    @song1 = Song.new("Thriller","Micheal Jackson")

    @song2 = Song.new("Like a Prayer","Madonna")

    @song3 = Song.new("I Wanna Dance With Somebody","Whitney Houston")

    @song4 = Song.new("It’s Gonna Be Me","N Sync")

    @song5 = Song.new("Everybody","Backstreet Boys")

    @song6 = Song.new("Livin On A Prayer","Bon Jovi")

    @song7 = Song.new("Back In Black","ACDC")

    @song8 = Song.new("Africa","")

    @song9 = Song.new("Twist And Shout","The Beatles")

    @lower_class = Rooms.new(5,30,[@song1,@song2,@song3,@song4,@song5,@song6,@song7,@song8,@song9])

    @guest1 = Guest.new([{
      name: "Nathan",
      alcohol_level: 0,
      wallet: 300,
      f_song: "Africa"}])
    @guest2 = Guest.new([{
      name: "Simon",
      alcohol_level: 0,
      wallet: 80,
      f_song: "Livin On A Prayer"}])
    @guest3 = Guest.new([{
      name: "Ben",
      alcohol_level: 0,
      wallet: 90,
      f_song: "Back In Black"}])
    @guest4 = Guest.new([{
      name: "Jack",
      alcohol_level: 0,
      wallet: 600,
      f_song: "Twist And Shout"}])


    @drink1 = Drinks.new([{
      name: "Yager Bomb",
      price: 2,
      alcohol_content: 2,
      stock: 50}])
    @drink2 = Drinks.new([{
      name: "Magners",
      price: 3,
      alcohol_content: 3,
      stock: 70}])
    @drink3 = Drinks.new([{
      name: "Gin & Tonic",
      price: 5,
      alcohol_content: 1,
      stock: 20}])
    @drink4 = Drinks.new([{
      name: "Sambuca",
      price: 5,
      alcohol_content: 4,
      stock: 100}])


  end

  def test_amount_of_rooms
    assert_equal(5,@lower_class.get_amount_of_rooms)
  end

  def test_get_price_of_rooms
    assert_equal(30, @lower_class.get_price_of_rooms)
  end

  def test_check_playlist
    assert_equal([],@lower_class.check_playlist)
  end

  def test_add_song_to_playlist
    @lower_class.add_song_to_playlist(@song4)
    assert_equal([@song4],@lower_class.check_playlist)
  end

  def test_add_song_to_playlist2
    @lower_class.add_song_to_playlist(@song6)
    assert_equal([@song6],@lower_class.check_playlist)
  end

  def test_add_song_to_playlist3
    @lower_class.add_song_to_playlist(@song5)
    @lower_class.add_song_to_playlist(@song4)
    @lower_class.add_song_to_playlist(@song7)
    assert_equal([@song5,@song4,@song7],@lower_class.check_playlist)
  end

  def test_play_songs_in_play_list
    @lower_class.add_song_to_playlist(@song5)
    @lower_class.add_song_to_playlist(@song4)
    @lower_class.add_song_to_playlist(@song7)

    result = @lower_class.play_song_in_playlist()

    assert_equal("Now Playing Everybody By Backstreet Boys.",result)
  end

  def test_delete_song_in_playlist
    @lower_class.add_song_to_playlist(@song5)
    @lower_class.add_song_to_playlist(@song4)
    @lower_class.add_song_to_playlist(@song7)

    @lower_class.delete_song_in_playlist


    result = @lower_class.amount_of_songs_in_playlist

    assert_equal(2,result)
  end

  def test_delete_song_in_playlist2
    result = @lower_class.delete_song_in_playlist

    assert_equal("No Songs Left In Playlist!",result)
  end

  def test_amount_of_songs_in_playlist
    @lower_class.add_song_to_playlist(@song5)
    @lower_class.add_song_to_playlist(@song4)
    @lower_class.add_song_to_playlist(@song7)

    result = @lower_class.amount_of_songs_in_playlist

    assert_equal(3,result)
  end

  def test_show_song_list
    result = @lower_class.show_song_list
    assert_equal(["Thriller : 1", "Like a Prayer : 2", "I Wanna Dance With Somebody : 3", "It’s Gonna Be Me : 4", "Everybody : 5", "Livin On A Prayer : 6", "Back In Black : 7", "Africa : 8", "Twist And Shout : 9"],result)
  end

  def test_caroke_play()
    @lower_class.caroke_choice(@guest1,1)
    result = @lower_class.check_playlist
    assert_equal([@song1],result)
    assert_equal(297,@guest1.get_guest_money)
    assert_equal(3,@lower_class.get_total_amount)
  end

  def test_caroke_play()
    result2 = @lower_class.caroke_choice(@guest1,10)
    result = @lower_class.check_playlist
    assert_equal([],result)
    assert_equal(300,@guest1.get_guest_money)
    assert_equal("Please Make A Valid Selection!", result2 )
  end

  def test_favourite_song()
    @lower_class.add_song_to_playlist(@song6)
    result = @lower_class.favourite_song(@guest2)
    assert_equal("WooHoo",result)
  end

  def test_buys_drink()
    @lower_class.guest_buys_drink(@guest1,@drink2)
    result1 = @guest1.get_guest_money
    result2 = @guest1.get_alcohol_level
    result3 = @drink2.get_stock_of_drink
    assert_equal(297,result1)
    assert_equal(3,result2)
    assert_equal(69,result3)
  end


end
