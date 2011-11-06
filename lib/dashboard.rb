require "redis_cacheable"
require "json"
require "rest-client"
require "nokogiri"
require "open-uri"

module Dashboard
  autoload :WolframSearch, "dashboard/wolfram_search"
  autoload :Composite, "dashboard/composite"
end

