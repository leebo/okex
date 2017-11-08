class FutureKline
  include Mongoid::Document
  include Mongoid::Timestamps
  field :kline, type: Array
  field :symbol, type: String
  field :contract_type, type: String
end
