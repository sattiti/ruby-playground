require 'logger'
require 'yaml'
require 'time'

yml = YAML.load_file('url.yml')
log = Logger.new(
  File.expand_path("#{File.dirname(__FILE__)}/#{Time.now.to_i}.log")
)

yml.each do |url|
  begin
    r = `curl -IsS #{url} | head -n 1"`.strip!
    log.info("#{r} #{url}")
  rescue => e
    log.error(e)
  end
end
