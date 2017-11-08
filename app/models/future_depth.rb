class FutureDepth
  include Mongoid::Document
  include Mongoid::Timestamps
  field :asks, type: Array
  field :bids, type: Array
  field :symbol, type: String
  field :contract_type, type: String
end
