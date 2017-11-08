class FutureTrade
  include Mongoid::Document
  include Mongoid::Timestamps
   field :trade, type: Array
   field :symbol, type: String
   field :contract_type, type: String
end
