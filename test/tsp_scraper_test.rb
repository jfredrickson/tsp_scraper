require 'test_helper'

class TSPScraperTest < Minitest::Test
  def test_version_number
    refute_nil TSPScraper::VERSION
  end
end
