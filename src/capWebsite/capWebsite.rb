require 'yaml'
require 'uri'
require 'fileutils'
require 'logger'
require 'time'
require 'watir'
require 'selenium-webdriver'
require 'pp'

# profile       = Selenium::WebDriver::Firefox::Profile.new
# proxy         = Selenium::WebDriver::Proxy.new(http: ":80")
# profile.proxy = proxy
# options       = Selenium::WebDriver::Firefox::Options.new(profile: profile)
# driver        = Selenium::WebDriver.for :firefox, options: options
# b             = Watir::Browser.new driver
b   = Watir::Browser.new :firefox
url = ''

begin
  curtDir    = Dir.pwd
  imgDir     = "#{curtDir}/images"
  log        = Logger.new("#{curtDir}/#{Time.now.to_i}.log")
  configFile = File.expand_path(ARGV[0])

  if !File.exists?(configFile)
    log.error("Error - #{configFile} not exists.")
    exit
  end

  yml = YAML.load_file(configFile)
  FileUtils.mkdir imgDir if !Dir.exists?(imgDir)

  yml['urls'].size.times do |j|
    url = URI.parse yml['urls'][j]
    b.goto url.to_s

    yml['dimension'].size.times do |i|
      size   = yml['dimension'][i]
      width  = size['width']
      height = size['height']
      margin = 100

      b.window.resize_to width, margin
      if height == 'auto'
        pageHeight = b.execute_script('return document.body.clientHeight | document.body.scrollHeight | document.documentElement.scrollHeight | document.documentElement.offsetHeight;').to_i + margin
      else
        pageHeight = height
      end

      dimensionInfo = "#{width}x#{pageHeight}"
      path          = url.path[url.path.size - 1] == '/' ? "#{url.path}index-#{dimensionInfo}" : "#{url.path}-#{dimensionInfo}"
      img           = File.expand_path("#{imgDir}/#{path.gsub(/^\//, '').gsub('/', '+')}.png")

      b.window.resize_to width, pageHeight
      b.screenshot.save img
      log.info("DONE- #{url.to_s} #{dimensionInfo}")
    end
  end
rescue => e
  
  log.error("#{url.to_s} #{e.message}")
ensure
  b.close
end
