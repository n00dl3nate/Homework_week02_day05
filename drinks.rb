class Drinks

attr_reader :stats

  def initialize(stats)

    @stats = stats

    @drinks = []


  end

  def get_name_of_drink
    return @stats[0][:name]
  end

  def get_price_of_drink
    return @stats[0][:price]
  end

  def get_alcohol_content_of_drink
    return @stats[0][:alcohol_content]
  end

  def get_stock_of_drink
    return @stats[0][:stock]
  end

  def remove_stock_of_drink
    @stats[0][:stock] -= 1
  end

  def show_list_of_drinks
    return
  end 



end
