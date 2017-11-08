class FutureIndex
  include Mongoid::Document
  include Mongoid::Timestamps
  field :future_index, type: Float
  field :symbol, type: String
end
