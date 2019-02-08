require 'csv'
require 'yaml'
require 'pp'

ENC      = 'utf-8'
csvFiles = ARGV

csvFiles.each do |file|
  if File.exists?(file)
    begin
      csv   = CSV.read(File.expand_path(file), {encoding: ENC, headers: true}).map(&:to_hash)
      nFile = File.expand_path(file.gsub('csv', 'yml'), File.expand_path(File.dirname(__FILE__)))

      File.open(nFile, 'w') do |f|
        f.write csv.to_yaml
      end
    rescue => e
      puts e
    end
  end
end
