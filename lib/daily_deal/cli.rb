
class DailyDeal::CLI
  def call
    puts "Welcome to Groupon Daily Deal Program."
    puts "--" * 20
    menu
    list_deals
    goodbye
  end

  def list_deals
    puts "Deals of Today:"
    DailyDeal::Scraper.scrape_groupon

    DailyDeal::Deal.all.each.with_index(1) do |deal, i|
      puts "#{i}. #{deal.title} "
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the deal you'd like more info on deals or type list, exit:"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i - 1 < DailyDeal::Deal.all.length
        the_deal = DailyDeal::Deal.all[input.to_i-1]
        # binding.pry
        puts "Tite: #{the_deal.title}"
        puts "Price: (#{the_deal.original_price})#{the_deal.discount_price} "
        puts "Bought: #{the_deal.bought}"
        puts "#{the_deal.url}"
      elsif input == "list"
        DailyDeal::Deal.all.clear
        list_deals
      elsif input != "list" || input != "exit" || input < 0
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "Bye see you soon for more deals!"
  end
end
