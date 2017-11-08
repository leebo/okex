class LtcUsdWorker
  include Sidekiq::Worker

  def perform()
   okex = Okexapi.new("d00ae24b-bf00-4dd6-814e-002af896f76e", "D198F90F2B76E6EFBC48A98FA3CB8A1D")
    future_ticker = okex.future_ticker("ltc_usd", "this_week")
    # future_depth = okex.future_depth("ltc_usd", "this_week")
    # future_trades = okex.future_trades("ltc_usd", "this_week")
    # future_index = okex.future_index("ltc_usd")
    # exchange_rate = okex.exchange_rate
    # future_estimated_price = okex.future_estimated_price("ltc_usd")
    # future_kline = okex.future_kline("ltc_usd", "1min", "this_week")
    # future_hold_amount = okex.future_hold_amount("ltc_usd", "this_week")
    # future_price_limit = okex.future_price_limit("ltc_usd", "this_week")
    FutureTicker.create(date: future_ticker["date"], last: future_ticker["ticker"]["last"], buy: future_ticker["ticker"]["buy"], sell: future_ticker["ticker"]["sell"], high: future_ticker["ticker"]["high"], low: future_ticker["ticker"]["low"], vol: future_ticker["ticker"]["vol"], contract_id: future_ticker["ticker"]["contract_id"], unit_amount: future_ticker["ticker"]["unit_amount"], symbol: "ltc_usd", contract_type: "this_week")
    # FutureDepth.create(asks: future_depth["asks"], bids: future_depth["bids"], symbol: "ltc_usd", contract_type: "this_week")
    # FutureTrade.create(trade: future_trades, symbol: "ltc_usd", contract_type: "this_week")
    # FutureIndex.create(future_index: future_index, symbol: "ltc_usd")
    # ExchangeRate.create(exchange_rate)
    # FutureEstimatedPrice.create(forecast_price: future_estimated_price, symbol: "ltc_usd")
    # FutureKline.create(kline: future_kline, symbol: "ltc_usd", contract_type: "this_week")
    # FutureHoldAmount.create(amount: future_hold_amount[0]["amount"], contract_name: future_hold_amount[0]["contract_name"], symbol: "ltc_usd", contract_type: "this_week")
    # FuturePriceLimit.create(high: future_price_limit["high"], low: future_price_limit["low"], usdCnyRate: future_price_limit["usdCnyRate"], symbol: "ltc_usd", contract_type: "this_week")
  end
end
