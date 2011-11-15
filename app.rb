require "sinatra"
$:.push(File.expand_path(File.dirname(__FILE__) + "/lib"))

require "dashboard"

get "/dashboard/:id" do
 comp           = Dashboard::Composite.load_by_id(params[:id])

 # Used in views/index.haml
 @price_text    = comp.current_hog_price
 @graph_points  = JSON.generate(comp.pig_foot_cycle_trends)
 @pig_news      = comp.pig_news
 @sales_leaders = comp.sales_leaders

 haml :index
end
