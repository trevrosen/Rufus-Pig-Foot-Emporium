require "redis_cacheable"
require "json"
require "rest-client"
require "nokogiri"
require "open-uri"

# NOTE: RSS feed source -- http://www.pigprogress.net/news/

module Dashboard
  autoload :WolframSearch, "dashboard/wolfram_search"
end

