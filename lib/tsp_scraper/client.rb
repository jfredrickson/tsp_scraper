require 'httparty'

module TSPScraper
  class Client
    include HTTParty
    disable_rails_query_string_format
    base_uri "https://www.tsp.gov/InvestmentFunds/FundPerformance"

    def self.scrape_raw(start_date = Date.today.prev_month, end_date = Date.today, options = {})
      funds = ["Linc", "L2010", "L2020", "L2030", "L2040", "L2050", "G", "F", "C", "S", "I"]
      default_options = {
        query: {
          reloaded: 1,
          startdate: start_date.strftime("%m/%d/%Y"),
          enddate: end_date.strftime("%m/%d/%Y"),
          whichButton: "CSV",
          fundgroup: funds
        }
      }
      options = default_options.merge(options)

      response = self.get("/index.html", options)
      response.body.strip
    end

    def self.scrape(start_date = Date.today.prev_month, end_date = Date.today, options = {})
      raw = self.scrape_raw(start_date, end_date, options = {})
      TSPScraper::Converter.raw_csv_to_hash(raw)
    end
  end
end
