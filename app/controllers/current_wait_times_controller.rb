require 'csv'
require 'open-uri'

class CurrentWaitTimesController < ApplicationController
  # GET /current_wait_times
  # GET /current_wait_times.json
  def index
    url = 'http://www.cbsa-asfc.gc.ca/bwt-taf/bwt-eng.csv'
    # url = "#{Rails.public_path}/bwt-eng.csv"
    csv_data = open(url)
    csv_rows = CSV.parse(csv_data.read, headers: true, col_sep: ';;')

    @current_wait_times = []

    csv_rows.each do |row|
      cwt = CurrentWaitTime.new
      # Using some number based indexes because of leading and trailign white space in csv datasets.
      cwt.customs_office = row['Customs Office']
      cwt.location = row[1]
      cwt.last_updated = row[2]
      cwt.commercial_flow_canada_bound = row[3]
      cwt.commercial_flow_us_bound = row[4]
      cwt.travellers_flow_canada_bound = row[5]
      cwt.travellers_flow_us_bound = row[6]
      cwt.lat = CurrentWaitTime::LOCATIONS[:"#{cwt.customs_office}"][:lat] if CurrentWaitTime::LOCATIONS[:"#{cwt.customs_office}"]
      cwt.lng = CurrentWaitTime::LOCATIONS[:"#{cwt.customs_office}"][:lng] if CurrentWaitTime::LOCATIONS[:"#{cwt.customs_office}"]

      @current_wait_times << cwt
    end

    @current_wait_times.sort_by!(&:customs_office)
  end

  def show
    @lat = params[:lat]
    @lng = params[:lng]  
    @city = params[:city]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_wait_time
      @current_wait_time = CurrentWaitTime.find(params[:id])
    end
end
