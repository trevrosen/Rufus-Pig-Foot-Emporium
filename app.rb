require "sinatra"
require "json"

get "/dashboard" do
 @title = "Hello, world!"

 @test_flot = JSON.generate([[1,3.2], [2, 4.1], [2.3, 4.6]])

 haml :index
end
