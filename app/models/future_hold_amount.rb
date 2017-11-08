class FutureHoldAmount
  include Mongoid::Document
  include Mongoid::Timestamps
  field :amount, type: Integer
  field :contract_name, type: String
  field :symbol, type: String
  field :contract_type, type: String
end
