require 'mechanize'
require 'pp'

urls = [
]

agent                  = Mechanize.new
agent.user_agent_alias = 'Mac Safari'
agent.set_proxy('SERVER', 80, '', '')
agent.verify_mode      = OpenSSL::SSL::VERIFY_NONE

begin
  urls.each do |url|
    agent.redirect_ok         = :permanent
    agent.follow_meta_refresh = :anywhere

    agent.get url do |page|
      pp page.code
    end
  end
rescue => e
  pp e
end
