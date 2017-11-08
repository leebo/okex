class Okexapi
	require 'rest-client'
	require 'json'

	########合约行情##########
	def initialize(api_key,secret_key)
	  # @symbol = symbol
	  # @contract_type = contract_type
	  @api_key = api_key
	  @secret_key = secret_key
	end
	# 获取OKEX合约行情
	def future_ticker(symbol,contract_type)
		response = RestClient.get "https://www.okex.com/api/v1/future_ticker.do?symbol=#{symbol}&contract_type=#{contract_type}"
		resultjson = JSON.parse(response.body)
	end
	# 获取OKEX合约深度信息
	def future_depth(symbol,contract_type)
		response = RestClient.get "https://www.okex.com/api/v1/future_depth.do?symbol=#{symbol}&contract_type=#{contract_type}"
		resultjson = JSON.parse(response.body)
	end
	# 获取OKEX合约交易记录信息
	def future_trades(symbol,contract_type)
		response = RestClient.get "https://www.okex.com/api/v1/future_trades.do?symbol=#{symbol}&contract_type=#{contract_type}"
		resultjson = JSON.parse(response.body)
	end
	# 获取OKEX合约指数信息
	def future_index(symbol)
		response = RestClient.get "https://www.okex.com/api/v1/future_index.do?symbol=#{symbol}"
		resultjson = JSON.parse(response.body)
	end
	# 获取美元人民币汇率
	def exchange_rate
		response = RestClient.get "https://www.okex.com/api/v1/exchange_rate.do"
		resultjson = JSON.parse(response.body)
	end
	# 获取交割预估价
	def future_estimated_price(symbol)
		response = RestClient.get "https://www.okex.com/api/v1/future_estimated_price.do?symbol=#{symbol}"
		resultjson = JSON.parse(response.body)
	end
	# 获取虚拟合约的K线数据
	def future_kline(symbol,type,contract_type)
		response = RestClient.get "https://www.okex.com/api/v1/future_kline.do?symbol=#{symbol}&type=#{type}&contract_type=#{contract_type}"
		resultjson = JSON.parse(response.body)
	end
	# 获取当前可用合约总持仓量
	def future_hold_amount(symbol,contract_type)
		response = RestClient.get "https://www.okex.com/api/v1/future_hold_amount.do?symbol=#{symbol}&contract_type=#{contract_type}"
		resultjson = JSON.parse(response.body)
	end
	# 获取合约最高买价和最低卖价
	def future_price_limit(symbol,contract_type)
		response = RestClient.get "https://www.okex.com/api/v1/future_price_limit.do?symbol=#{symbol}&contract_type=#{contract_type}"
		resultjson = JSON.parse(response.body)
	end

	########合约交易###########
	# 获取OKEX合约账户信息 （全仓）
	def future_userinfo
		parameters = ["api_key=#{@api_key}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/future_userinfo.do",{api_key: @api_key, sign: sign}
		resultjson = JSON.parse(response.body)
	end
	# 获取用户持仓获取OKEX合约账户信息 （全仓）
	def future_position(symbol,contract_type)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "contract_type=#{contract_type}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/future_position.do",{api_key: @api_key, sign: sign, symbol: symbol, contract_type: contract_type}
		resultjson = JSON.parse(response.body)
	end
	# 合约下单
	def future_trade(symbol,contract_type,price,amount,type,match_price,lever_rate)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "contract_type=#{contract_type}", "price=#{price}", "amount=#{amount}", "type=#{type}", "match_price=#{match_price}", "lever_rate=#{lever_rate}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/future_trade.do",{api_key: @api_key, sign: sign, symbol: symbol, contract_type: contract_type, price: price, amount: amount, type: type, match_price: match_price, lever_rate: lever_rate}
		resultjson = JSON.parse(response.body)
	end
	# 获取OKEX合约交易历史（非个人)
	def future_trades_history(symbol,date,since)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "date=#{date}", "since=#{since}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/future_trades_history.do",{api_key: @api_key, sign: sign, symbol: symbol, date: date, since: since}
		resultjson = JSON.parse(response.body)
	end
	# 批量下单
	def future_batch_trade(symbol,contract_type,orders_data,lever_rate)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "contract_type=#{contract_type}", "orders_data=#{orders_data}", "lever_rate=#{lever_rate}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/future_batch_trade.do",{api_key: @api_key, sign: sign, symbol: symbol, contract_type: contract_type, orders_data: orders_data, lever_rate: lever_rate}
		resultjson = JSON.parse(response.body)
	end
	# 取消合约订单
	def future_cancel(symbol,contract_type,order_id)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "order_id=#{order_id}", "contract_type=#{contract_type}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/future_cancel.do",{api_key: @api_key, sign: sign, symbol: symbol, order_id: order_id, contract_type: contract_type}
		resultjson = JSON.parse(response.body)
	end
	# 获取合约订单信息
	def future_order_info(symbol,contract_type,status,order_id,current_page,page_length)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "contract_type=#{contract_type}", "status=#{status}", "order_id=#{order_id}", "current_page=#{current_page}", "page_length=#{page_length}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/future_order_info.do",{api_key: @api_key, sign: sign, symbol: symbol, contract_type: contract_type, status: status, order_id: order_id, current_page: current_page, page_length: page_length}
		resultjson = JSON.parse(response.body)
	end
	# 批量获取合约订单信息
	def future_orders_info(symbol,contract_type,order_id)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "contract_type=#{contract_type}", "order_id=#{order_id}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/future_orders_info.do",{api_key: @api_key, sign: sign, symbol: symbol, contract_type: contract_type, order_id: order_id}
		resultjson = JSON.parse(response.body)
	end
	# 获取逐仓合约账户信息
	def future_userinfo_4fix
		parameters = ["api_key=#{@api_key}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/future_userinfo_4fix.do",{api_key: @api_key, sign: sign}
		resultjson = JSON.parse(response.body)
	end
	# 逐仓用户持仓查询
	def future_position_4fix(symbol,contract_type,type)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "contract_type=#{contract_type}", "type=#{type}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/future_position_4fix.do",{api_key: @api_key, sign: sign, symbol: symbol, contract_type: contract_type, type: type}
		resultjson = JSON.parse(response.body)
	end
	# 获取合约爆仓单
	def future_explosive(symbol,contract_type,status,current_page,page_number,page_length)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "contract_type=#{contract_type}", "status=#{status}", "current_page=#{current_page}", "page_number=#{page_number}", "page_length=#{page_length}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/future_explosive.do",{api_key: @api_key, sign: sign, symbol: symbol, contract_type: contract_type, status: status, current_page: current_page, page_number: page_number, page_length: page_length}
		resultjson = JSON.parse(response.body)
	end
	# 个人账户资金划转
	def future_devolve(symbol,type,amount)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "type=#{type}", "amount=#{amount}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/future_devolve.do",{api_key: @api_key, sign: sign, symbol: symbol, type: type, amount: amount}
		resultjson = JSON.parse(response.body)
	end

	########现货行情#########
	# 获取OKEx现货行情
	def ticker(symbol)
		response = RestClient.get "https://www.okex.com/api/v1/ticker.do?symbol=#{symbol}"
		resultjson = JSON.parse(response.body)
	end
	# 获取OKEx现货市场深度
	def depth(symbol)
		response = RestClient.get "https://www.okex.com/api/v1/depth.do?symbol=#{symbol}"
		resultjson = JSON.parse(response.body)
	end
	# 获取OKEx现货交易信息(600条)
	def trades(symbol,since)
		response = RestClient.get "https://www.okex.com/api/v1/trades.do?symbol=#{symbol}&since=#{since}"
		resultjson = JSON.parse(response.body)
	end
	# 获取OKEx现货K线数据
	def kline(symbol,type)
		response = RestClient.get "https://www.okex.com/api/v1/kline.do?symbol=#{symbol}&type=#{type}"
		resultjson = JSON.parse(response.body)
	end

	#########现货交易#########
	# 获取用户信息
	def userinfo
		parameters = ["api_key=#{@api_key}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/userinfo.do",{api_key: @api_key, sign: sign}
		resultjson = JSON.parse(response.body)
	end
	# 下单交易
	def trade(symbol,type,price,amount)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "type=#{type}", "price=#{price}", "amount=#{amount}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/trade.do",{api_key: @api_key, sign: sign, symbol: symbol, type: type, price: price, amount: amount}
		resultjson = JSON.parse(response.body)
	end
	# 批量下单
	def batch_trade(symbol,type,orders_data)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "type=#{type}", "orders_data=#{orders_data}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/batch_trade.do",{api_key: @api_key, sign: sign, symbol: symbol, type: type, orders_data: orders_data}
		resultjson = JSON.parse(response.body)
	end
	# 撤销订单
	def cancel_order(symbol,order_id)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "order_id=#{order_id}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/cancel_order.do",{api_key: @api_key, sign: sign, symbol: symbol, order_id: order_id}
		resultjson = JSON.parse(response.body)
	end
	# 获取用户的订单信息
	def order_info(symbol,order_id)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "order_id=#{order_id}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/order_info.do",{api_key: @api_key, sign: sign, symbol: symbol, order_id: order_id}
		resultjson = JSON.parse(response.body)
	end
	# 批量获取用户订单
	def orders_info(symbol,order_id)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "order_id=#{order_id}", "type=#{type}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/orders_info.do",{api_key: @api_key, sign: sign, symbol: symbol, order_id: order_id, type: type}
		resultjson = JSON.parse(response.body)
	end
	# 获取历史订单信息，只返回最近两天的信息
	def order_history(symbol,status,current_page,page_length)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "status=#{status}", "current_page=#{current_page}", "page_length=#{page_length}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/order_history.do",{api_key: @api_key, sign: sign, symbol: symbol, status: status, current_page: current_page, page_length: page_length}
		resultjson = JSON.parse(response.body)
	end
	# 提币BTC/LTC/ETH/ETC/BCC
	def withdraw(symbol,chargefee,trade_pwd,withdraw_address,withdraw_amount,target)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "chargefee=#{chargefee}", "trade_pwd=#{trade_pwd}", "withdraw_address=#{withdraw_address}", "withdraw_amount=#{withdraw_amount}", "target=#{target}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/withdraw.do",{api_key: @api_key, sign: sign, symbol: symbol, chargefee: chargefee, trade_pwd: trade_pwd, withdraw_address: withdraw_address, withdraw_amount: withdraw_amount, target: target}
		resultjson = JSON.parse(response.body)
	end
	# 取消提币BTC/LTC/ETH/ETC/BCC
	def cancel_withdraw(symbol,withdraw_id)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "withdraw_id=#{withdraw_id}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/cancel_withdraw.do",{api_key: @api_key, sign: sign, symbol: symbol, withdraw_id: withdraw_id}
		resultjson = JSON.parse(response.body)
	end
	# 查询提币BTC/LTC/ETH/ETC/BCC信息
	def withdraw_info(symbol,withdraw_id)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "withdraw_id=#{withdraw_id}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/withdraw_info.do",{api_key: @api_key, sign: sign, symbol: symbol, withdraw_id: withdraw_id}
		resultjson = JSON.parse(response.body)
	end
	# 获取用户提现/充值记录
	def account_records(symbol,type,current_page,page_length)
		parameters = ["api_key=#{@api_key}", "symbol=#{symbol}", "type=#{type}", "current_page=#{current_page}", "page_length=#{page_length}"]
		sign = sign(parameters)
		response = RestClient.post "https://www.okex.com/api/v1/account_records.do",{api_key: @api_key, sign: sign, symbol: symbol, type: type, current_page: current_page, page_length: page_length}
		resultjson = JSON.parse(response.body)
	end

	# 获取签名
	private
		def sign(parameters)
			parameters.sort!
			result = ""
			parameters.each do |parameter|
				result = result + parameter + "&"
			end
			result = result + "secret_key=#{@secret_key}"
			sign = Digest::MD5.hexdigest(result).upcase
		end
end
# okex = Okex.new("d00ae24b-bf00-4dd6-814e-002af896f76e","D198F90F2B76E6EFBC48A98FA3CB8A1D")
# puts okex.future_ticker("btc_usd","this_week")
# puts okex.future_depth("btc_usd","this_week")
# puts okex.exchange_rate
# puts okex.future_userinfo
# puts okex.future_position("btc_usd", "this_week")
# puts okex.userinfo
# puts okex.account_records("btc", 0, 1, 20)
# puts okex.future_kline("btc_usd", "1min", "this_week")[0]