class DailyDeal::Deal
  attr_accessor :title, :original_price, :discount_price, :description,:bought, :ratings, :url

  def self.today
    self.scrape_deals
  end

  def self.scrape_deals
    deals = []
    deals << self.scrape_groupon
    deals
  end

  def self.scrape_groupon
    doc = Nokogiri::HTML(open("https://www.groupon.com/occasion/deals-of-the-day"))

    deal = self.new
    deal.title = doc.search(".cui-udc-title").text.strip
    deal.original_price = doc.search(".cui-original-price").text.strip
    deal.discount_price = doc.search(".cui-discount-price").text.strip
    deal.bought = doc.search(".cui-quantity-bought").text.strip
    deal.ratings = doc.search(".cui-review-rating").text.strip
    # deal.url = doc.search("li.a").first.attr("href").strip
    # deal.description = doc.search("h3")
    deal
  end
end
