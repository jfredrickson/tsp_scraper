require 'test_helper'

class ClientTest < Minitest::Test
  def setup
    @client = TSPScraper::Client
    @start_date = Date.new(2016, 8, 15) # Mon, 15 Aug 2016
    @end_date = Date.new(2016, 8, 19) # Fri, 19 Aug 2016
  end

  def test_scrape_raw
    expected = "date, Linc,  L2025,  L2030,  L2035,  L2040,  L2045,  L2050,  L2055,  L2060,  L2065,  G,  F,  C,  S,  I\n2016-08-19, 18.246400, , 26.350000, , 28.083200, , 15.945000, , , , 15.085000, 17.950100, 29.884100, 38.374000, 24.660600\n2016-08-18, 18.256200, , 26.389800, , 28.131900, , 15.975600, , , , 15.084400, 17.985700, 29.923000, 38.393800, 24.778100\n2016-08-17, 18.241800, , 26.330300, , 28.058000, , 15.928100, , , , 15.083800, 17.958700, 29.856600, 38.156000, 24.677800\n2016-08-16, 18.238500, , 26.322200, , 28.049200, , 15.923500, , , , 15.083200, 17.938800, 29.793700, 38.241900, 24.713200\n2016-08-15, 18.258300, , 26.413000, , 28.162700, , 15.996700, , , , 15.082600, 17.954800, 29.952300, 38.574100, 24.806000"
    result = @client.scrape_raw(@start_date, @end_date)
    assert_equal expected, result
  end

  def test_scrape
    result = @client.scrape(@start_date, @end_date)
    assert_equal 5, result.count
    assert_equal 9, result.first[:funds].count
  end
end
