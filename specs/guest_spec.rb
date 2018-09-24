require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")


class GuestTest < MiniTest::Test


  def setup

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

  end

  def test_get_customer_name
    assert_equal("Ben",@guest3.get_guest_name)
  end

  def test_get_guest_money
    result = @guest4.get_guest_money()
    assert_equal(600,result)
  end

  def test_get_favourite_song
    result = @guest3.get_guest_favourite_song
    assert_equal("Back In Black", result)
  end

  def test_get_alcohol_level
    result = @guest1.get_alcohol_level
    assert_equal(0,result)
  end

  def test_remove_money
    @guest1.remove_money(50)
    result = @guest1.get_guest_money
    assert_equal(250,result)
  end
#
end
