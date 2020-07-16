require 'httparty'

module TSPScraper
  class Client
    include HTTParty
    disable_rails_query_string_format
    base_uri "https://secure.tsp.gov/components/CORS"

    def self.scrape_raw(start_date = Date.today.prev_month, end_date = Date.today, options = {})
      default_options = {
        query: {
          download: 1,
          startdate: start_date.strftime("%Y%m%d"),
          enddate: end_date.strftime("%Y%m%d"),
          format: "CSV",
          Lfunds: 1,
          InvFunds: 1
        }
      }
      options = default_options.merge(options)
      response = self.get("/getSharePrices.html", options)
      response.body.strip
    end

    def self.scrape(start_date = Date.today.prev_month, end_date = Date.today, options = {})
      raw = self.scrape_raw(start_date, end_date, options = {})
      TSPScraper::Converter.raw_csv_to_hash(raw)
    end
  end
end
