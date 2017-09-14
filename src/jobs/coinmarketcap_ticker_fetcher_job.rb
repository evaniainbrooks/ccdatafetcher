require 'active_job'
require 'delayed_job'
require 'rest-client'
require 'json'

class CoinmarketcapTickerFetcherJob < ActiveJob::Base
  TICKER_ENDPOINT = 'https://api.coinmarketcap.com/v1/ticker'.freeze
  
  queue_as :default

  rescue_from(StandardError) do |exception|
    STDERR.puts e.message
  end

  def perform params
    limit = params.fetch(:limit, 20)
    currency = params.fetch(:currency, 'USD')
    api_params = { limit: limit, convert: currency }

    client = RestClient::Resource.new(TICKER_ENDPOINT)
    response = client.get(params: api_params)

    tickers = JSON.parse(response.body)
    tickers.collect do |ticker|
      attrs = ticker.slice(*Ticker.column_names).symbolize_keys
      attrs[:currency] = currency
      attrs[:price] = ticker["price_#{currency.downcase}"]
      attrs[:volume] = ticker["24h_volume_#{currency.downcase}"]
      attrs[:market_cap] = ticker["market_cap_#{currency.downcase}"]
      
      Ticker.create(attrs.except(:id))
    end
  end
end
