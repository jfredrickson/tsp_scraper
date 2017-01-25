module TSPScraper
  class CLI
    def self.start
      begin
        end_date_raw = ARGV.pop
        start_date_raw = ARGV.pop
        start_date = Date.parse(start_date_raw)
        end_date = Date.parse(end_date_raw)
      rescue
        print_help
        exit 1
      end
      quotes = TSPScraper::Client.scrape(start_date, end_date)
      print_quotes quotes
    end

    def self.print_help
      puts "Usage: tsp_scraper START_DATE END_DATE"
      puts "START_DATE and END_DATE should be in the format YYYY-MM-DD."
    end

    def self.print_quotes(quotes)
      quotes.each do |quote|
        quote[:funds].each do |name, price|
          puts "#{quote[:date]},#{name},#{price.to_s('F')}"
        end
      end
    end
  end
end
