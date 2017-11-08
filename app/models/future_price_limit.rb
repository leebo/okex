class FuturePriceLimit
  include Mongoid::Document
  include Mongoid::Timestamps
  field :high, type: Float
  field :low, type: Float
  field :usdCnyRate, type: Float
  field :symbol, type: String
  field :contract_type, type: String
end
