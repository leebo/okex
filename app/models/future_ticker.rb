class FutureTicker
  include Mongoid::Document
  include Mongoid::Timestamps
  field :date, type: String
  field :last, type: Float
  field :buy, type: Float
  field :sell, type: Float
  field :high, type: Float
  field :low, type: Float
  field :vol, type: Float
  field :contract_id, type: Integer
  field :unit_amount, type: Float
  field :symbol, type: String
  field :contract_type, type: String
end
