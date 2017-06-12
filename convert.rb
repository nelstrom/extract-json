require 'smarter_csv'
require 'json'
FileUtils.mkdir_p('data')
FileUtils.rm_rf(Dir.glob('data/*'))

records = SmarterCSV.process('./2017-data-breaches.csv')
records.each_with_index do |record, index|
  filename = (index+1).to_s.rjust(3, "0")
  File.open("data/#{filename}.json", 'a') do |w|
    w.puts JSON.pretty_generate(record)
  end
end
