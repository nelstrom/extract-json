require 'smarter_csv'
require 'json'
FileUtils.mkdir_p('data')
FileUtils.rm_rf(Dir.glob('data/*'))

class YearConverter
  # Years are encoded
  # 0  = 2004
  # 8  = 2012
  # 9  = 2013
  # 10 = 2014
  # 11 = 2015
  # 12 = 2016
  # 13 = latest
  def self.convert(value)
    {
      0  => '2004',
      8  => '2012',
      9  => '2013',
      10 => '2014',
      11 => '2015',
      12 => '2016',
      13 => '2017',
    }[value]
  end
end

options = {
  :remove_empty_values => false,
  :key_mapping => {
    :entity => :title,
    :story => :text,
    :records_lost => nil
  },
  :value_converters => {
    :year => YearConverter
  }
}

index = 0
records = SmarterCSV.process('./2017-data-breaches.csv', options)
records.each do |record|
  unless record[:text].to_s.strip.empty?
    index += 1
    filename = (index).to_s.rjust(3, "0")
    File.open("data/#{filename}.json", 'a') do |w|
      w.puts JSON.pretty_generate(record)
    end
  end
end
