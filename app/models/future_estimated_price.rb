class FutureEstimatedPrice
  include Mongoid::Document
  include Mongoid::Timestamps
  field :forecast_price, type: Float
  field :symbol, type: String
end
