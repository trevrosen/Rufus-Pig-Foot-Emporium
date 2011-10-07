require "sinatra"

get "/dashboard" do
 @title = "Hello, world!"
 haml :index
end
