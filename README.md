# tsp_scraper

Scrapes fund price history from the TSP.gov website.

## Installation

```sh
gem install tsp_scraper
```

## Usage

The `scrape` method returns CSV data:

```ruby
require 'tsp_scraper'
TSPScraper::Client.scrape() # Get trailing one month's prices
TSPScraper::Client.scrape("2016-01-01", "2016-01-31") # Get January prices
```

The `scrape` method also accepts an options hash for the HTTP request. The options hash should contain [HTTParty](https://github.com/jnunemaker/httparty) options.

```ruby
TSPScraper::Client.scrape("2016-01-01", "2016-01-31", verify: false) # Don't verify SSL certificate
```
