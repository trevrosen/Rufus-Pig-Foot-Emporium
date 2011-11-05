require "sinatra"
$:.unshift(File.expand_path(File.dirname(__FILE__) + "/lib"))

require "dashboard"

get "/dashboard" do
 @title = "Hello, world!"

 @test_flot = JSON.generate([[1,3.2], [2, 4.1], [2.3, 4.6]])

 @price_text = Dashboard::WolframSearch.new.price_text

 haml :index
end
