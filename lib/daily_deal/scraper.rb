class DailyDeal::Scraper

  def self.scrape_groupon
    puts "*********Scraping******"
    doc = Nokogiri::HTML(open("https://www.groupon.com/occasion/deals-of-the-day"))
    deal_parent = doc.css('.card-ui.cui-c-udc.c-bdr-gray-clr')
    deal_parent.each do |figure|
      deal = DailyDeal::Deal.new
      deal.title = figure.css(".cui-udc-title").text.strip
      deal.original_price = figure.css(".cui-price-original-same-size").text.strip
      deal.discount_price = figure.search("span.cui-price-discount-same-size").text.strip
      deal.bought = figure.css(".cui-quantity-bought").text.strip
      deal.ratings = figure.css(".cui-review-rating").text.strip
      deal.url = figure.css("a").attr("href")
      deal.description = deal.url.css('article.twelve.columns.pitch').text.strip
    end
  end
#
end
