require_relative("./songs.rb")
require_relative("./guest.rb")

class Rooms

  attr_accessor :amount , :cost ,:playlist, :tracklist

  def initialize(amount,cost,tracklist)

    @amount = amount
    @cost = cost

    @tracklist = tracklist
    @play_list = []
    # @playlist = []

  end


  def get_total_amount
    return @bill
  end

  def get_amount_of_rooms
    return @amount
  end

  def get_price_of_rooms
    return @cost
  end

  def check_playlist
    return @play_list
  end

  def add_song_to_playlist(song)
    @play_list << song
  end

  def play_song_in_playlist
    return "Now Playing #{@play_list[0].get_name_of_song} By #{@play_list[0].get_artist}."
  end

  def delete_song_in_playlist
    if @play_list.length == 0
      return "No Songs Left In Playlist!"
    else
      @play_list.delete_at(0)
    end

  end

  def amount_of_songs_in_playlist
    return @play_list.length
  end

  ###/////////////////////////////////////////////////////

  def show_song_list()
    tracklist = []
    @tracklist.each_with_index {|song,index| tracklist << "#{song.get_name_of_song} : #{index + 1}" }
    return tracklist
  end

  def show_song_list_playlist
    tracklist = []
    @play_list.each_with_index{|song| tracklist << " |#{song.get_name_of_song} by #{song.get_artist}"}
    return tracklist
  end



  def caroke_choice(guest,choice)
    for selection in @tracklist
      if @tracklist.index(selection) == choice - 1
        @play_list << selection
        guest.remove_money(3)
      end
    end
    if choice > 9
      return "Please Make A Valid Selection!"
    end
  end

  def favourite_song(guest)
     if @play_list[0].get_name_of_song == guest.get_guest_favourite_song
       return "WooHoo"
     end
  end

  def guest_buys_drink(guest,drink)
    guest.remove_money(drink.get_price_of_drink)
    guest.increase_alcohol_level(drink.get_alcohol_content_of_drink)
    drink.remove_stock_of_drink
  end

end
