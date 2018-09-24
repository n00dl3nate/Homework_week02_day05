require("minitest/autorun")
require("minitest/rg")
require('pry')
require_relative("../drinks.rb")


class DrinksTest < MiniTest::Test


  def setup

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

  def test_get_name_of_drink
    result = @drink1.get_name_of_drink
    assert_equal("Yager Bomb", result)
  end

  def test_get_price_of_drink
    result = @drink1.get_price_of_drink
    assert_equal(2, result)
  end

  def test_get_alcohol_of_drink
    result = @drink1.get_alcohol_content_of_drink
    assert_equal(2, result)
  end

  def test_get_stock_of_drink
    result = @drink1.get_stock_of_drink
    assert_equal(50, result)
  end

  def test_removal_of_drink_from_stock
    @drink2.remove_stock_of_drink
    # result = @drink2[0]
    assert_equal(69,@drink2.get_stock_of_drink)
  end

end
