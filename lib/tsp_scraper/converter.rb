module TSPScraper
  class Converter
    # TSP CSV has a janky format:
    #   - Each field in a row, except for the first field, is prepended by a space
    # For this reason, we manually clean up the CSV instead of using the Ruby CSV library, especially since we know TSP
    # does not use quotation marks in their CSV fields... at least for now.
    def self.raw_csv_to_hash(raw_csv)
      raw_data = raw_csv.lines.map { |row| row.strip.split(',').map { |field| field.strip } }
      headers = raw_data.shift
      data = []
      raw_data.each do |d|
        hash = {
          date: Date.parse(d.first),
          funds: {}
        }
        headers.each_with_index do |header, index|
          next if index == 0
          hash[:funds][header] = BigDecimal(d[index]) unless d[index].empty?
        end
        data.push(hash)
      end
      data
    end
  end
end
