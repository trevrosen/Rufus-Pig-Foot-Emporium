module Dashboard
  class Composite 
    attr_reader :id
    attr_reader :pig_news                                                   # News from PigProgress.net
    attr_reader :current_hog_price, :price_history, :most_recent_trade_info # Wolfram Alpha stats
    attr_reader :sales_leaders, :pig_foot_cycle_trends                      # Made-up BS

    include RedisCacheable

    def initialize(id)
      @id = id
    end

    def load_from_live_or_redis
      if exists_in_redis?
        self.rc_read!
      else
        load_from_live
      end
    end

    def load_from_live
      # load pig_news
      # @pig_news = Feedzirra::Feed.fetch_and_parse('http://pigprogress.net/index.xml')
      
      # load Wolfram stuff
      wolfram_hogs            = Dashboard::WolframSearch.new
      @current_hog_price      = wolfram_hogs.current_price
      @price_history          = wolfram_hogs.price_history
      @most_recent_trade_info = wolfram_hogs.most_recent_trade_info

      @sales_leaders          = load_sales_leaders

      # load pig_foot_cycle_trends
    end
    
    def load_sales_leaders
      SalesLeader.find(10)
    end



  end
end
