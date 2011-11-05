module Dashboard
  class WolframSearch
    attr_reader :doc

    WOLFRAM_ALPHA_APP_ID = "47Y4Y2-98W27H9TRH"
    LEAN_HOGS_QUERY = "http://api.wolframalpha.com/v2/query?input=lean+hogs+commodity+price&appid=#{WOLFRAM_ALPHA_APP_ID}"

    def initialize(query=LEAN_HOGS_QUERY)
      @doc = Nokogiri::HTML(open(query))
    end

    def price_text
      @doc.xpath('//pod[@title="Result"]/subpod/plaintext').children.first.text
    end
    
  end
end
