# tsp_scraper

[![Gem Version](https://badge.fury.io/rb/tsp_scraper.svg)](https://badge.fury.io/rb/tsp_scraper)

Scrapes fund price history from the TSP.gov website.

## Installation

```sh
gem install tsp_scraper
```

## Usage

The `scrape` method returns data in a hash:

```ruby
require 'tsp_scraper'
TSPScraper::Client.scrape() # Get trailing one month's prices
TSPScraper::Client.scrape("2016-01-01", "2016-01-31") # Get January prices
```

The returned hash has the format:

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

You can get the raw CSV data as returned by the TSP website by using `TSPScraper::Client.scrape_raw()`.

The `scrape` and `scrape_raw` methods also accept an options hash for the HTTP request. The options hash should contain [HTTParty](https://github.com/jnunemaker/httparty) options.

```ruby
TSPScraper::Client.scrape("2016-01-01", "2016-01-31", verify: false) # Don't verify SSL certificate
```
