require 'active_job'
require 'delayed_job'

class CoinmarketcapTickerFetcherJob < ActiveJob::Base
  queue_as :default

  def perform
    puts "I ran!"
  end
end
