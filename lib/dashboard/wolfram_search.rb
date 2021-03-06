module Dashboard
  class WolframSearch
    attr_reader :doc

    WOLFRAM_ALPHA_APP_ID = "47Y4Y2-98W27H9TRH"
    LEAN_HOGS_QUERY = "http://api.wolframalpha.com/v2/query?input=lean+hogs+commodity+price&appid=#{WOLFRAM_ALPHA_APP_ID}"

    def initialize(local=true)
      if local
        wolfram_file = File.open((File.expand_path(File.dirname(__FILE__) + "../../../fixtures/wolfram_hogs_query.xml"))).read
        @doc = Nokogiri::XML.parse(wolfram_file)
      else
        @doc = Nokogiri::XML(open(LEAN_HOGS_QUERY))
      end
    end

    def current_price
      doc.xpath('//pod[@title="Result"]/subpod/plaintext').first.content
    end

    def price_history
      doc.xpath('//pod[@title="Price history"]/subpod/plaintext').first.content
    end

    def most_recent_trade_info
      doc.xpath('//pod[@id="DailyTradeInformation:FuturesData"]/subpod/plaintext').first.content
    end
    
  end
end


