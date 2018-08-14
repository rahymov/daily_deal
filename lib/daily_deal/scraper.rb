# class DailyDeal::Scraper
#
#   def self.get_page
#     Nokogoro::HTML(open("https://www.groupon.com/occasion/deals-of-the-day"))
#   end
#   def self.scrape_deals
#      self.get_page.css('.cui-udc-title .c-txt-black .should-truncate .is-truncated').text
#   end
#   def make_deals
#     self.scrape_deals.each do |d|
#       DailyDeal::Deal.new(d)
#     end
#   end
#
# end
