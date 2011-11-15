module Dashboard
  class Composite 
    attr_reader :id
    attr_reader :pig_news                                                   # News from PigProgress.net
    attr_reader :current_hog_price, :price_history, :most_recent_trade_info # Wolfram Alpha stats
    attr_reader :sales_leaders, :pig_foot_cycle_trends                      # Made-up BS

    def self.load_by_id(id)
      new(id).load_all_stats
    end

    def initialize(id)
      @id = id
    end

    def load_all_stats
      @pig_news               = load_pig_news
      wolfram_hogs            = Dashboard::WolframSearch.new
      @current_hog_price      = wolfram_hogs.current_price
      @price_history          = wolfram_hogs.price_history
      @most_recent_trade_info = wolfram_hogs.most_recent_trade_info
      @sales_leaders          = load_sales_leaders
      @pig_foot_cycle_trends  = load_pig_foot_cycle_trends
      self
    end
    
    def load_sales_leaders
      SalesLeader.find(10)
    end

    def load_pig_foot_cycle_trends
      TrotterTrends.find(3).collect(&:trendline)
    end

    def load_pig_news(local=true)
      if local
        sleep 2
        news_file = File.open(File.expand_path(File.dirname(__FILE__) + "../../../fixtures/pignews.xml"), 'r').read
        Feedzirra::Feed.parse(news_file)
      else
        Feedzirra::Feed.fetch_and_parse('http://www.pigprogress.net/index.xml')
      end
    end
  end
end
