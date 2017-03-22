class CurrentWaitTime
  include ActiveModel::Model
  attr_accessor :customs_office, :location, :last_updated, :commercial_flow_canada_bound, :commercial_flow_us_bound, :travellers_flow_canada_bound, :travellers_flow_us_bound, :lat, :lng

  LOCATIONS = {
    'Abbotsford-Huntingdon' => {lat: '49.0030105', lng: '-122.2674067'},
    'St. Stephen' => {lat: '45.1702016', lng: '-67.327635'},
    'St. Stephen 3rd Bridge' => {lat: '45.1702016', lng: '-67.327635'},
    'Edmundston' => {lat: '47.3621801', lng: '-68.3310569'},
    'Woodstock Road' => {lat: '46.1360198', lng: '-67.7839951'},
    'Stanstead' => {lat: '45.0083616', lng: '-72.0985691'},
    'St-Armand/Philipsburg' => {lat: '45.032563', lng: '-73.0511936'},
    'St-Bernard-de-Lacolle' => {lat: '45.0097992', lng: '-73.4545071'},
    'Cornwall' => {lat: '45.0046968', lng: '-74.7472673'},
    'Prescott' => {lat: '44.745418', lng: '-75.4714947'},
    'Thousand Islands Bridge' => {lat: '44.3293353', lng: '-76.0145349'},
    'Sault Ste. Marie' => {lat: '46.5066645', lng: '-84.3692396'},
    'Fort Frances Bridge' => {lat: '48.6086733', lng: '-93.4021076'},
    'Queenston-Lewiston Bridge' => {lat: '43.1534254', lng: '-79.0475782'},
    'Rainbow Bridge' => {lat: '43.0901511', lng: '-79.0852796'},
    'Peace Bridge' => {lat: '42.9069465', lng: '-78.908198'},
    'Blue Water Bridge' => {lat: '42.9985613', lng: '-82.4260657'},
    'Windsor and Detroit Tunnel' => {lat: '42.3201255', lng: '-83.0636196'},
    'Ambassador Bridge' => {lat: '42.311972', lng: '-83.0764917'},
    'Emerson' => {lat: '49.0008795', lng: '-97.2409057'},
    'North Portal' => {lat: '48.999246', lng: '-102.5566267'},
    'Coutts' => {lat: '48.9987369', lng: '-111.9622822'},
    'Pacific Highway' => {lat: '49.0022416', lng: '-122.7376092'},
    'Douglas (Peace Arch)' => {lat: '49.0022412', lng: '-122.7441753'},
    'Boundary Bay' => {lat: '49.0021561', lng: '-122.8755024'}
  }.freeze
end
