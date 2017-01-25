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
  s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.require_paths = ['lib']
  s.license = 'MIT'
  s.required_ruby_version = '>= 1.9.3'
  s.executables = ['tsp_scraper']

  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'minitest', '~> 5.9'
end
