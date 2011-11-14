module Dashboard
  class Composite 
    attr_reader :id
    attr_reader :pig_news                                                   # News from PigProgress.net
    attr_reader :current_hog_price, :price_history, :most_recent_trade_info # Wolfram Alpha stats
    attr_reader :sales_leaders, :pig_foot_cycle_trends                      # Made-up BS

    include RedisCacheable

    def self.load_by_id(id)
      new(id).load_from_live_or_redis
    end

    def initialize(id)
      @id = id
    end

    def load_from_live_or_redis
      create_or_update unless exists_in_redis?
      self.rc_read
    end

    def create_or_update
      @pig_news = Feedzirra::Feed.fetch_and_parse('http://www.pigprogress.net/index.xml')
      
      wolfram_hogs            = Dashboard::WolframSearch.new
      @current_hog_price      = wolfram_hogs.current_price
      @price_history          = wolfram_hogs.price_history
      @most_recent_trade_info = wolfram_hogs.most_recent_trade_info

      @sales_leaders          = load_sales_leaders
      @pig_foot_cycle_trends  = load_pig_foot_cycle_trends

      self.rc_write!
    end
    
    def load_sales_leaders
      SalesLeader.find(10)
    end

    def load_pig_foot_cycle_trends
      TrotterTrends.find(3).collect(&:trendline)
    end

  end
end
