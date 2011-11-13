require "sinatra"
$:.unshift(File.expand_path(File.dirname(__FILE__) + "/lib"))

require "dashboard"

get "/dashboard" do
 @title = "Hello, world!"

 @test_flot = JSON.generate([[1,3.2], [2, 4.1], [2.3, 4.6]])

 # @price_text = Dashboard::WolframSearch.new.current_price
 # @pig_news = Feedzirra::Feed.fetch_and_parse('http://www.pigprogress.net/index.xml')

 pig_xml = open(File.expand_path(File.dirname(__FILE__) + "/fixtures/pignews.xml")).read

 @pig_news = Feedzirra::Feed.parse(pig_xml)

 @sales_leaders = Dashboard::SalesLeader.find(10)

 haml :index
end
