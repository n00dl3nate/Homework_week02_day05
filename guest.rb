

class Guest

  attr_accessor :details

  def initialize(details)

  @details = details

  @money = 100

  end

  @new_guest = Guest.new([{
    name:"",
    alcohol_level: 0,
    wallet: @money ,
    f_song:"",
    }])


  def get_guest_name()
    return @details[0][:name]
  end

  def get_guest_money()
    return @details[0][:wallet]
  end

  def get_guest_favourite_song()
    return @details[0][:f_song]
  end

  def get_alcohol_level()
    return @details[0][:alcohol_level]
  end

  def remove_money(money)
    @details[0][:wallet] -= money
  end

  def set_name(name)
    @details[0] = {
      name: name,
      alcohol_level: 0,
      wallet:0,
      f_song:"",
      }
    end

  def increase_alcohol_level(alcohol)
    @details[0][:alcohol_level] += alcohol
  end
end
