require 'test_helper'

class FutureTickersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @future_ticker = future_tickers(:one)
  end

  test "should get index" do
    get future_tickers_url
    assert_response :success
  end

  test "should get new" do
    get new_future_ticker_url
    assert_response :success
  end

  test "should create future_ticker" do
    assert_difference('FutureTicker.count') do
      post future_tickers_url, params: { future_ticker: { buy: @future_ticker.buy, coin_vol: @future_ticker.coin_vol, contract_id: @future_ticker.contract_id, day_high: @future_ticker.day_high, day_low: @future_ticker.day_low, high: @future_ticker.high, last: @future_ticker.last, low: @future_ticker.low, sell: @future_ticker.sell, unit_amount: @future_ticker.unit_amount, vol: @future_ticker.vol } }
    end

    assert_redirected_to future_ticker_url(FutureTicker.last)
  end

  test "should show future_ticker" do
    get future_ticker_url(@future_ticker)
    assert_response :success
  end

  test "should get edit" do
    get edit_future_ticker_url(@future_ticker)
    assert_response :success
  end

  test "should update future_ticker" do
    patch future_ticker_url(@future_ticker), params: { future_ticker: { buy: @future_ticker.buy, coin_vol: @future_ticker.coin_vol, contract_id: @future_ticker.contract_id, day_high: @future_ticker.day_high, day_low: @future_ticker.day_low, high: @future_ticker.high, last: @future_ticker.last, low: @future_ticker.low, sell: @future_ticker.sell, unit_amount: @future_ticker.unit_amount, vol: @future_ticker.vol } }
    assert_redirected_to future_ticker_url(@future_ticker)
  end

  test "should destroy future_ticker" do
    assert_difference('FutureTicker.count', -1) do
      delete future_ticker_url(@future_ticker)
    end

    assert_redirected_to future_tickers_url
  end
end
