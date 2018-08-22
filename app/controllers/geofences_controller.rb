class GeofencesController < ApplicationController
  before_action :set_geofence, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /geofences
  # GET /geofences.json
  def index
    @geofences = current_user.geofences
  end


  # GET /geofences/1
  # GET /geofences/1.json
  def show
  end

  # GET /geofences/new
  def new
    @geofence = Geofence.new
  end

  # GET /geofences/1/edit
  def edit
  end

  # POST /geofences
  # POST /geofences.json
  def create
    @geofence = Geofence.new(geofence_params)
    @geofence.user_id = current_user.id  # Preenchendo o campo com o id do usuário logado
    respond_to do |format|
      if @geofence.save
        format.html { redirect_to @geofence, notice: 'Geofence was successfully created.' }
        format.json { render :show, status: :created, location: @geofence }
      else
        format.html { render :new }
        format.json { render json: @geofence.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /geofences/1
  # PATCH/PUT /geofences/1.json
  def update
    respond_to do |format|
      if @geofence.update(geofence_params)
        format.html { redirect_to @geofence, notice: 'Geofence was successfully updated.' }
        format.json { render :show, status: :ok, location: @geofence }
      else
        format.html { render :edit }
        format.json { render json: @geofence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geofences/1
  # DELETE /geofences/1.json
  def destroy
    @geofence.destroy
    respond_to do |format|
      format.html { redirect_to geofences_url, notice: 'Geofence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geofence
      begin
        @geofence = current_user.geofences.find(params[:id])
      rescue Exception => e
        flash[:alert] = 'Geofence not found.'
        redirect_to root_url
      end
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def geofence_params
      params.require(:geofence).permit(:name, :lat, :lon, :radius)
    end
  end
