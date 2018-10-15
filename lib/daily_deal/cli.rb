
class DailyDeal::CLI
  def call
    puts "Welcome to Groupon Daily Deal Program."
    puts "--" * 20
    DailyDeal::Scraper.scrape_groupon
    list_deals
    menu
  end

  def list_deals
    puts "Deals of Today:"
    DailyDeal::Deal.all.each.with_index(1) do |deal, i|
      puts "#{i}. #{deal.title} "
    end
  end

  def menu
    @input = ""
    while @input != "exit"
      puts "Enter the number of the deal you'd like more info on deals or type list, exit:"
      @input = gets.strip.downcase

      if @input.to_i.between?(1,DailyDeal::Deal.all.length)
        the_deal = DailyDeal::Deal.all[@input.to_i-1]
        puts "Tite: #{the_deal.title}"
        puts "Price: (#{the_deal.original_price})#{the_deal.discount_price} "
        puts "Bought: #{the_deal.bought}"
        puts "#{the_deal.url}"
      elsif @input == "list"
        list_deals
      elsif @input == "list" || @input.to_i < 0 
        puts "Not sure what you want, type list or exit."
      elsif @input == "exit"
        goodbye
      end
    end
  end

  def goodbye
    puts "Bye see you soon for more deals!"
  end
end
