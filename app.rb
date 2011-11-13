require "sinatra"
$:.push(File.expand_path(File.dirname(__FILE__) + "/lib"))

require "dashboard"

get "/dashboard/:id" do

 @test_flot = JSON.generate([[1,3.2], [2, 4.1], [2.3, 4.6]])

 comp           = Dashboard::Composite.load_by_id(params[:id])
 @price_text    = comp.current_hog_price
 @pig_news      = comp.pig_news
 @sales_leaders = comp.sales_leaders

 haml :index
end
