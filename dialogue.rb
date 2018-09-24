require_relative("./room.rb")
require_relative("./songs.rb")
require_relative("./guest.rb")
require_relative("./dialogue")

class Dialogue

  def initialize
  end

  def introduction_startup
    return "Hello And Welcome To CodeClan Caraoke \nWhat Is Your Name?"
    # return "\n Please Choose A Room Type And Select A Playlist..."
    # return "\n Please Add A Song To The playlist By Entering The Number Relating To The Coresponding Song."
    # return "\n £3 Per Song"
    end

  def return_name(guest)
    return "Your Name is #{guest.get_guest_name}.\nIs This Correct?\nType yes to confirm."
  end

  def bar_or_caraoke
    return "Press C to enter caraoke or press B to go to the bar."
  end

  def welcome_caraoke()
    "\nPlease Add A Song To The playlist By Entering The Number Relating To The Coresponding Song."
    # "Your current playlist #{room.check_playlist}."
  end

  def current_playlist(room)
    "\nYour current playlist #{room.check_playlist}."
  end



end
