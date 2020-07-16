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
  s.required_ruby_version = '>= 2.4.0'
  s.executables = ['tsp_scraper']

  s.add_runtime_dependency 'httparty', '~> 0.17.1'
  s.add_development_dependency 'bundler', '~> 2.1.4'
  s.add_development_dependency 'rake', '~> 13.0.0'
  s.add_development_dependency 'pry', '~> 0.12.2'
  s.add_development_dependency 'minitest', '~> 5.12.2'
end
