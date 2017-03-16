require 'csv'
require 'open-uri'

class CurrentWaitTimesController < ApplicationController
  before_action :set_current_wait_time, only: [:show, :edit, :update, :destroy]

  # GET /current_wait_times
  # GET /current_wait_times.json
  def index
    #url = 'http://www.cbsa-asfc.gc.ca/bwt-taf/bwt-eng.csv'
    url = "#{Rails.public_path}/bwt-eng.csv"
    csv_data = open(url)
    csv_rows = CSV.read(csv_data, headers: true, col_sep: ';;')

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

      @current_wait_times << cwt
    end

    @current_wait_times.sort_by!(&:customs_office)
  end

  # GET /current_wait_times/1
  # GET /current_wait_times/1.json
  def show
  end

  # GET /current_wait_times/new
  def new
    @current_wait_time = CurrentWaitTime.new
  end

  # GET /current_wait_times/1/edit
  def edit
  end

  # POST /current_wait_times
  # POST /current_wait_times.json
  def create
    @current_wait_time = CurrentWaitTime.new(current_wait_time_params)

    respond_to do |format|
      if @current_wait_time.save
        format.html { redirect_to @current_wait_time, notice: 'Current wait time was successfully created.' }
        format.json { render :show, status: :created, location: @current_wait_time }
      else
        format.html { render :new }
        format.json { render json: @current_wait_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /current_wait_times/1
  # PATCH/PUT /current_wait_times/1.json
  def update
    respond_to do |format|
      if @current_wait_time.update(current_wait_time_params)
        format.html { redirect_to @current_wait_time, notice: 'Current wait time was successfully updated.' }
        format.json { render :show, status: :ok, location: @current_wait_time }
      else
        format.html { render :edit }
        format.json { render json: @current_wait_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /current_wait_times/1
  # DELETE /current_wait_times/1.json
  def destroy
    @current_wait_time.destroy
    respond_to do |format|
      format.html { redirect_to current_wait_times_url, notice: 'Current wait time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_wait_time
      @current_wait_time = CurrentWaitTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def current_wait_time_params
      params[:current_wait_time]
    end
end
