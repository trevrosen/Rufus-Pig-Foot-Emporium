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
    
  end
end
