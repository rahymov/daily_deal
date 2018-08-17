class DailyDeal::Deal
  attr_accessor :title, :original_price, :discount_price, :description,:bought, :ratings, :url
  @@all = []

  def self.all
    @@all
  end

  def self.scrape_groupon
    doc = Nokogiri::HTML(open("https://www.groupon.com/occasion/deals-of-the-day"))
    deal_parent = doc.css('.card-ui.cui-c-udc.c-bdr-gray-clr')
    deal_parent.each do |figure|
      deal = self.new
      deal.title = figure.css(".cui-udc-title").text.strip
      deal.original_price = figure.css(".cui-price-original").text.strip
      deal.discount_price = figure.search("span.cui-price-discount").text.strip
      deal.bought = figure.css(".cui-quantity-bought").text.strip
      deal.ratings = figure.css(".cui-review-rating").text.strip
      deal.url = figure.css("a").attr("href")
      url = deal.url
      deal.description = url.css('article.twelve.columns.pitch').text.strip
      @@all << deal
    end
  end
end
