class TickerAllWorker
  include Sidekiq::Worker

  def perform()
    TickerWorker.perform_async('btc_usd', 'this_week')
    TickerWorker.perform_async('btc_usd', 'next_week')
    TickerWorker.perform_async('btc_usd', 'quarter')
    TickerWorker.perform_async('ltc_usd', 'this_week')
    TickerWorker.perform_async('ltc_usd', 'next_week')
    TickerWorker.perform_async('ltc_usd', 'quarter')
    TickerWorker.perform_async('eth_usd', 'this_week')
    TickerWorker.perform_async('eth_usd', 'next_week')
    TickerWorker.perform_async('eth_usd', 'quarter')
    TickerWorker.perform_async('etc_usd', 'this_week')
    TickerWorker.perform_async('etc_usd', 'next_week')
    TickerWorker.perform_async('etc_usd', 'quarter')
  end
end
