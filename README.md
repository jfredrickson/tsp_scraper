# tsp_scraper

[![Gem Version](https://badge.fury.io/rb/tsp_scraper.svg)](https://badge.fury.io/rb/tsp_scraper)
[![Travis CI](https://travis-ci.org/jfredrickson/tsp_scraper.svg?branch=master)](https://travis-ci.org/jfredrickson/tsp_scraper)

Scrapes fund price history from the TSP.gov website.

## Installation

```sh
gem install tsp_scraper
```

## Usage

The `tsp_scraper` gem includes both an API and a command-line interface (CLI).

### API Usage

The `scrape` method accepts `Date` objects as parameters and returns TSP price data as an array of hashes:

```ruby
require 'tsp_scraper'
TSPScraper::Client.scrape() # Get trailing one month's prices
TSPScraper::Client.scrape(start_date, end_date) # Get January prices
```

The returned array of hashes has the format:

```
[
  {
    :date => DATE1,
    :funds => {
      "FUND NAME 1" => #<BigDecimal>,
      "FUND NAME 2" => #<BigDecimal>,
      "FUND NAME 3" => #<BigDecimal>
    }
  },
  {
    :date => DATE2,
    :funds => {
      "FUND NAME 1" => #<BigDecimal>,
      "FUND NAME 2" => #<BigDecimal>,
      "FUND NAME 3" => #<BigDecimal>
    }
  },
  {
    :date => DATE3,
    :funds => {
      "FUND NAME 1" => #<BigDecimal>,
      "FUND NAME 2" => #<BigDecimal>,
      "FUND NAME 3" => #<BigDecimal>
    }
  }
]
```

You can get the raw CSV data as returned by the TSP website by using `TSPScraper::Client.scrape_raw()`, which accepts the same parameters as the `scrape` method.

#### HTTParty Options

The `scrape` and `scrape_raw` methods also accept an options hash for the HTTP request. The options hash should contain [HTTParty](https://github.com/jnunemaker/httparty) options.

```ruby
TSPScraper::Client.scrape(start_date, end_date, verify: false) # Don't verify SSL certificate
```

### CLI Usage

Installing the gem makes the `tsp_scraper` command available to you.

```
tsp_scraper START_DATE END_DATE
```

START_DATE and END_DATE should be in the format YYYY-MM-DD.

```
$ tsp_scraper 2017-01-23 2017-01-24
2017-01-24,L Income,18.5121
2017-01-24,L 2010,0.0                      
2017-01-24,L 2020,24.7183                                              
2017-01-24,L 2030,27.2166             
2017-01-24,L 2040,29.1416                                  
2017-01-24,L 2050,16.6275                  
2017-01-24,G Fund,15.2106
2017-01-24,F Fund,17.4619
2017-01-24,C Fund,31.4713
2017-01-24,S Fund,42.0024
2017-01-24,I Fund,25.2087
2017-01-23,L Income,18.4934
2017-01-23,L 2010,0.0
2017-01-23,L 2020,24.6629
2017-01-23,L 2030,27.12
2017-01-23,L 2040,29.0183
2017-01-23,L 2050,16.5456
2017-01-23,G Fund,15.2096
2017-01-23,F Fund,17.5237
2017-01-23,C Fund,31.2661
2017-01-23,S Fund,41.434
2017-01-23,I Fund,25.1846
```
