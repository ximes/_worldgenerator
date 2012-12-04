class ZonesController < ApplicationController
  # GET /zones
  # GET /zones.json

  def map

    @climates = Climate.all
    #check boundaries
    bound_x=Zone.maximum(:x)-Zone.minimum(:x)
    bound_y=Zone.maximum(:y)-Zone.minimum(:y)

    @zones = Zone.all
    
    @boundaries = []
    @boundaries = {:x => bound_x, :y => bound_y}

    respond_to do |format|
      format.html # map.html.erb
      format.json { render json: @zones }
    end
  end

  def index
    @x = params[:x].blank? ? 0 : params[:x].to_i
    @y = params[:y].blank? ? 0 : params[:y].to_i
    @z = params[:z].blank? ? 0 : params[:z].to_i



    #create the zone if doesn't exist
    @zone = Zone.find_or_create_by_x_and_y_and_z(@x, @y, @z)
    @zone.visited=true
    @zone.save


    #get the existing climates
    @climates = []
    climates_list = []
    climates=Climate.all()
    climates.each do |climate|
      climate[:distance] = Math::sqrt((climate.x - @zone.x)**2 + (climate.y - @zone.y)**2)
    end
    climates.keep_if {|v| v[:radius] >= v[:distance] || v[:default]}




    #create the climate if doesn't exist

    if climates.size <= 2

      #check boundaries
      bound_x=Range.new(Zone.minimum("x").to_i, Zone.maximum("x").to_i)
      bound_y=Range.new(Zone.minimum("y").to_i, Zone.maximum("y").to_i)
      bound_z=Range.new(Zone.minimum("z").to_i, Zone.maximum("z").to_i)

      #check directions
      dir_x = @x.to_i>=0 ? 1 : -1
      dir_y = @y.to_i>=0 ? 1 : -1
      dir_z = @z.to_i>=0 ? 1 : -1

    @bound = "s"
    random_value = ((Random.rand(bound_x) + Random.rand(bound_y) + Random.rand(bound_z))/3).to_i.abs
      
    new_climate=Climate.new()
    new_climate.name = rand(36**16).to_s(36)
    new_climate.x = @x+dir_x*Random.rand(random_value)
    new_climate.y = @y+dir_y*Random.rand(random_value)
    new_climate.z = @z+dir_z*Random.rand(random_value)
    new_climate.color = "##{Random.rand(255).to_s(16)}#{Random.rand(255).to_s(16)}#{Random.rand(255).to_s(16)}"
    new_climate.radius = random_value
    new_climate.scale = Random.rand(100)/10
    new_climate.save()
    end

    

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
