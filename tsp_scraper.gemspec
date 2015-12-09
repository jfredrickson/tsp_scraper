lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tsp_scraper/version'

Gem::Specification.new do |s|
  s.name = 'tsp_scraper'
  s.summary = 'Scrapes fund price history from the TSP.gov website'
  s.description = 'Scrapes fund price history from the TSP.gov website.'
  s.homepage = 'https://github.com/jfredrickson/tsp_scraper'
  s.version = TSPScraper::VERSION
  s.authors = ['Jeff Fredrickson']
  s.email = %w(jeff.fredrickson@gmail.com)
  s.files = `git ls-files -z`.split("\x0")
  s.require_paths = ['lib']
  s.license = 'MIT'
  s.required_ruby_version = '>= 1.9.3'
  s.executables = ['tsp_scraper']

  s.add_runtime_dependency 'httparty', '~> 0.13'
end
