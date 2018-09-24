require_relative("./room.rb")
require_relative("./songs.rb")
require_relative("./drinks.rb")
require_relative("./guest.rb")
require_relative("./dialogue")
require('pry')

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

@drinks = [@drink1,@drink2,@drink3,@drink4]

@song1 = Song.new("Thriller","Micheal Jackson")

@song2 = Song.new("Like a Prayer","Madonna")

@song3 = Song.new("I Wanna Dance With Somebody","Whitney Houston")

@song4 = Song.new("It’s Gonna Be Me","N Sync")

@song5 = Song.new("Everybody","Backstreet Boys")

@song6 = Song.new("Livin On A Prayer","Bon Jovi")

@song7 = Song.new("Back In Black","ACDC")

@song8 = Song.new("Africa","")

@song9 = Song.new("Twist And Shout","The Beatles")

@caraoke = Rooms.new(5,30,[@song1,@song2,@song3,@song4,@song5,@song6,@song7,@song8,@song9])

# @money = 100

@guest1 = Guest.new([{
  name: "",
  alcohol_level: 0,
  wallet: @money,
  f_song: "Africa"}])

@dialogue = Dialogue.new()

#Variables
question = ""
question2 = ""
#****************************************************************************************************************************************#
  while question != "yes"
puts @dialogue.introduction_startup
name = gets.chomp!
@guest1.set_name(name)
puts @dialogue.return_name(@guest1)
question = gets.chomp!.downcase
puts `clear`
  end

  while 1 > 0
    puts @dialogue.welcome_caraoke()
    puts "\n"
    puts @caraoke.show_song_list
    answer = gets.chomp!

    if answer.downcase == "bar"
      while question != "exit"
        puts `clear`
        puts "welcome to the bar"
        puts "here is a list of our drinks"

        drinks = []
        @drinks.each_with_index {|drink,index| drinks << "|#{index}:#{drink.get_name_of_drink}| Price £#{drink.get_price_of_drink} | Alcohol Content:#{drink.get_alcohol_content_of_drink}|"}
        puts drinks

        question = gets.chomp!
        puts "\nTo buy a drink Type in the number of the drink and press enter"
        puts "\nTo exit type exit"
      end
    end



    if answer.downcase == "play"
        while question != "exit" || @caraoke.amount_of_songs_in_playlist > 0

          puts `clear`
          puts @caraoke.play_song_in_playlist

          puts "\nIf You Want to add more songs type exit."
          puts "\nTo play next song type next."
          puts "\n"

          question = gets.chomp!
            if question == "next"
            @caraoke.delete_song_in_playlist
            end
        end
    end


      answer = answer.to_i

      puts `clear`
      puts "Too enter Bar please type in bar"
      puts "Your Current Playlist Can be Viewed Below"
      puts @caraoke.caroke_choice(@guest1,answer)
      puts
      puts "\n|You have £#{@guest1.get_guest_money} in your wallet|"
      puts @caraoke.show_song_list_playlist
    end
