class CurrentWaitTime
  include ActiveModel::Model
  attr_accessor :customs_office, :location, :last_updated, :commercial_flow_canada_bound, :commercial_flow_us_bound, :travellers_flow_canada_bound, :travellers_flow_us_bound, :lat, :lng

  LOCATIONS = {'Abbotsford-Huntingdon': {lat: '49.0030105', lng: '-122.2674067'}}
end
