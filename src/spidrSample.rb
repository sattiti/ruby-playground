require 'spidr'
require 'pp'
require "mechanize"

u     = 'https://www.apple.com/'
num   = 0
agent = Mechanize.new

proxy = {
  :host     => '',
  :port     => 80,
  :user     => '',
  :password => ''
}

Spidr.proxy=(proxy)
agent.set_proxy(proxy[:host], proxy[:port], proxy[:user], proxy[:password])

Spidr.site(u) do |spider|
  begin
    t = Thread.new do
      spider.every_page do |page|
        mPage = agent.get(page.url.to_s)
        pp mPage.encoding
        pp mPage.header

        pp "#{num}: #{page.url.to_s}"
        num += 1
      end
    end
    t.join
  rescue => e
    puts e.message
  ensure
    Thread.kill(t)
  end
end
