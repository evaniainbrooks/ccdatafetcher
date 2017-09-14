require_relative 'boot'

module CCDataFetcher
  class ApiServer
    def self.data(env)
      req = Rack::Request.new(env)
      ticker_sym = req.params.fetch('ticker', 'BTC')
      currency_sym = req.params.fetch('currency', 'USD')

      tickers = Ticker.where(symbol: ticker_sym).where(currency: currency_sym)
      json_response = JSON.generate(tickers.collect(&:attributes))

      ['200', {'Content-Type' => 'application/json'}, [json_response]]
    end

    def self.latest(env)
      req = Rack::Request.new(env)
      limit = req.params.fetch('limit', 20)
      currency_sym = req.params.fetch('currency', 'USD')

      tickers = Ticker.where(currency: currency_sym).select("DISTINCT ON(symbol) *").order("symbol, created_at DESC").limit(limit)
      json_response = JSON.generate(tickers.collect(&:attributes))

      ['200', {'Content-Type' => 'application/json'}, [json_response]]
    end
  end
end
