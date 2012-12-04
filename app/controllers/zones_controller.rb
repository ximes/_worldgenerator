class ZonesController < ApplicationController
  # GET /zones
  # GET /zones.json
  def map
    @zones = Zone.all

    respond_to do |format|
      format.html # map.html.erb
      format.json { render json: @zones }
    end
  end

  def index
    @x = params[:x].blank? ? 0 : params[:x]
    @y = params[:y].blank? ? 0 : params[:y]
    @z = params[:z].blank? ? 0 : params[:z]

    @zone = Zone.find_or_create_by_x_and_y_and_z(@x, @y, @z)
    @zone.visited=true
    @zone.save

    @climates = []
    climates_list = []
    climates=Climate.all()
    climates.each do |climate|
      climate[:distance] = Math::sqrt((climate.x - @zone.x)**2 + (climate.y - @zone.y)**2)
    end
    climates.keep_if {|v| v[:radius] >= v[:distance] || v[:default]}

    climates.sort_by { |h| h[:distance] }
    @climates = climates

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @zone }
    end
  end

  # GET /zones/1
  # GET /zones/1.json
  def show
    @zone = Zone.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @zone }
    end
  end

  # GET /zones/new
  # GET /zones/new.json
  def new
    @zone = Zone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @zone }
    end
  end

  # GET /zones/1/edit
  def edit
    @zone = Zone.find(params[:id])
  end

  # POST /zones
  # POST /zones.json
  def create
    @zone = Zone.new(params[:zone])

    respond_to do |format|
      if @zone.save
        format.html { redirect_to @zone, notice: 'Zone was successfully created.' }
        format.json { render json: @zone, status: :created, location: @zone }
      else
        format.html { render action: "new" }
        format.json { render json: @zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /zones/1
  # PUT /zones/1.json
  def update
    @zone = Zone.find(params[:id])

    respond_to do |format|
      if @zone.update_attributes(params[:zone])
        format.html { redirect_to @zone, notice: 'Zone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zones/1
  # DELETE /zones/1.json
  def destroy
    @zone = Zone.find(params[:id])
    @zone.destroy

    respond_to do |format|
      format.html { redirect_to map_url }
      format.json { head :no_content }
    end
  end
end
