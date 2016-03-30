class RestsController < ApplicationController
  before_action :set_rest, only: [:show, :edit, :update, :destroy, :map_link, :star]
  before_action :authenticate_owner!, only: [:new, :edit]
  before_action :authenticate_user!, only: [:star]
  # GET /rests
  # GET /rests.json

  def index
    @rests = Rest.all
    if user_signed_in?
      @star = current_user.id 
    end
  end

  # GET /rests/1
  # GET /rests/1.json
  def show
    map_link
    @num_stars = @rest.stars.count
  end

  # GET /rests/new
  def new
    @rest = Rest.new
  end

  # GET /rests/1/edit
  def edit
  end

  def star
    @rest.stars.create(user_id: current_user.id, starred: true)
    binding.pry
  end

  # POST /rests
  # POST /rests.json
  def create
    @rest = Rest.new(rest_params)
    @rest.owners << current_owner
    respond_to do |format|
      if @rest.save
        format.html { redirect_to @rest, notice: 'Rest was successfully created.' }
        format.json { render :show, status: :created, location: @rest }
      else
        format.html { render :new }
        format.json { render json: @rest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rests/1
  # PATCH/PUT /rests/1.json
  def update
    respond_to do |format|
      if @rest.update(rest_params)
        format.html { redirect_to @rest, notice: 'Rest was successfully updated.' }
        format.json { render :show, status: :ok, location: @rest }
      else
        format.html { render :edit }
        format.json { render json: @rest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rests/1
  # DELETE /rests/1.json
  def destroy
    @rest.destroy
    respond_to do |format|
      format.html { redirect_to rests_url, notice: 'Rest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def map_link
    map_url_array = ["https://maps.googleapis.com/maps/api/staticmap?markers="]
    map_url_array.push(@rest.address.gsub(/\s+/, "+"))
    map_url_array.push("&zoom=16&size=400x400&key=")
    map_url_array.push("#{Rails.application.secrets.google_map_api}")
    @map_url_string = map_url_array.join
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rest
      @rest = Rest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rest_params
      params.require(:rest).permit(:name, :address, :description, :owner, :phone)
    end
end
