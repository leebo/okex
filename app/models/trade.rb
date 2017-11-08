class Trade
  include Mongoid::Document
  include Mongoid::Timestamps
  field :trade, type: Array
  field :symbol, type: String
end
