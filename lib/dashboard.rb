require "redis_cacheable"
require "json"
require "rest-client"
require "nokogiri"
require "open-uri"
require "feedzirra"

module Dashboard
  autoload :WolframSearch, "dashboard/wolfram_search"
  autoload :Composite, "dashboard/composite"
  autoload :SalesLeader, "dashboard/sales_leader"
end

