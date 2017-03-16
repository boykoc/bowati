class CurrentWaitTime
  include ActiveModel::Model
  attr_accessor :customs_office, :location, :last_updated, :commercial_flow_canada_bound, :commercial_flow_us_bound, :travellers_flow_canada_bound, :travellers_flow_us_bound
end
