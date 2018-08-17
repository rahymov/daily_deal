require 'pry'
class DailyDeal::CLI
  def call
    puts "Welcome to Daily Deal Program."
    list_deals
    menu
    goodbye
  end

  def list_deals
    puts "Deals of Today:"
    DailyDeal::Deal.scrape_groupon

    @deals = DailyDeal::Deal.all

    @deals.each.with_index(1) do |deal, i|
      puts "#{i}. #{deal.title} "
      # - #{deal.ratings}
      # i += 1
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the deal you'd like more info on deals or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_deal = @deals[input.to_i-1]
        puts "#{the_deal.title} - (#{the_deal.original_price}) #{the_deal.discount_price} - #{the_deal.bought} - #{the_deal.url} - #{the_deal.description}"
        # binding.pry
      elsif input == "list"
        list_deals
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "Bye see you soon for more deals!"
  end
end
