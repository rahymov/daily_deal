class DailyDeal::Deal
  attr_accessor :title, :original_price, :discount_price, :description,:bought, :ratings, :url
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end


end
