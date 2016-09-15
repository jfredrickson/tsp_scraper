# tsp_scraper

[![Gem Version](https://badge.fury.io/rb/tsp_scraper.svg)](https://badge.fury.io/rb/tsp_scraper)

Scrapes fund price history from the TSP.gov website.

## Installation

```sh
gem install tsp_scraper
```

## Usage

The `scrape` methods accept `Date` objects as parameters and return TSP price data as an array of hashes:

```ruby
require 'tsp_scraper'
TSPScraper::Client.scrape() # Get trailing one month's prices
TSPScraper::Client.scrape(date) # Get prices for a specific date
TSPScraper::Client.scrape(start_date, end_date) # Get January prices
```

The returned array of hashes has the format:

```
[
  {
    date: DATE1,
    funds: [
      { fund: "FUND NAME 1", price: "12.3456" },
      { fund: "FUND NAME 2", price: "12.3456" },
      { fund: "FUND NAME 3", price: "12.3456" }
    ]
  },
  {
    date: DATE2,
    funds: [
      { fund: "FUND NAME 1", price: "12.3456" },
      { fund: "FUND NAME 2", price: "12.3456" },
      { fund: "FUND NAME 3", price: "12.3456" }
    ]
  },
  {
    date: DATE3,
    funds: [
      { fund: "FUND NAME 1", price: "12.3456" },
      { fund: "FUND NAME 2", price: "12.3456" },
      { fund: "FUND NAME 3", price: "12.3456" }
    ]
  }
]
```

You can get the raw CSV data as returned by the TSP website by using `TSPScraper::Client.scrape_raw()`, which accepts the same parameters as the `scrape` method.

### HTTParty Options

The `scrape` and `scrape_raw` methods also accept an options hash for the HTTP request. The options hash should contain [HTTParty](https://github.com/jnunemaker/httparty) options.

```ruby
TSPScraper::Client.scrape(start_date, end_date, verify: false) # Don't verify SSL certificate
```
