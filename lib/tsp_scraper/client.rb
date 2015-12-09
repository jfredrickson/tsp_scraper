require 'httparty'

module TSPScraper
  class Client
    include HTTParty
    disable_rails_query_string_format
    base_uri "https://www.tsp.gov/InvestmentFunds/FundPerformance"

    def self.scrape(start_date = Date.today.prev_month, end_date = Date.today)
      funds = ["Linc", "L2010", "L2020", "L2030", "L2040", "L2050", "G", "F", "C", "S", "I"]
      options = {
        query: {
          reloaded: 1,
          startdate: start_date.strftime("%m/%d/%Y"),
          enddate: end_date.strftime("%m/%d/%Y"),
          whichButton: "CSV",
          fundgroup: funds
        }
      }
      response = self.get("/index.html", options)
      csv = response.body.strip
    end
  end
end
