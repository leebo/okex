class Kline
  include Mongoid::Document
  include Mongoid::Timestamps
  field :kline, type: Array
  field :symbol, type: String
end
