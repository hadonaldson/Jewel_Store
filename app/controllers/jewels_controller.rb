class JewelsController < ApplicationController
  before_action :set_jewel, only: [:show, :edit, :update, :destroy]

  # GET /jewels
  # GET /jewels.json
  def index
    @jewels = Jewel.all
  end
  
  def flop
    jewel = Jewel.find(params[:id])
    jewel.available = "No"
    jewel.save

    redirect_to collection_path
  end

  def sell
    jewel = Jewel.find(params[:id])
    jewel.available = "Yes"
    jewel.save

    redirect_to collection_path
  end

  # GET /jewels/1
  # GET /jewels/1.json
  def show
  end

  # GET /jewels/new
  def new
    @jewel = Jewel.new
    @collections = Collection.all.map{|c| [c.name, c.id]}
  end

  # GET /jewels/1/edit
  def edit
    @collections = Collection.all.map{|c| [c.name, c.id]}
  end

  # POST /jewels
  # POST /jewels.json
  def create
    @jewel = Jewel.new(jewel_params)
    @jewel.collection_id = params[:collection_id]

    respond_to do |format|
      if @jewel.save
        format.html { redirect_to @jewel, notice: 'Jewel was successfully created.' }
        format.json { render :show, status: :created, location: @jewel }
      else
        format.html { render :new }
        format.json { render json: @jewel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jewels/1
  # PATCH/PUT /jewels/1.json
  def update
    respond_to do |format|
      if @jewel.update(jewel_params)
        format.html { redirect_to @jewel, notice: 'Jewel was successfully updated.' }
        format.json { render :show, status: :ok, location: @jewel }
      else
        format.html { render :edit }
        format.json { render json: @jewel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jewels/1
  # DELETE /jewels/1.json
  def destroy
    @jewel.destroy
    respond_to do |format|
      format.html { redirect_to jewels_url, notice: 'Jewel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jewel
      @jewel = Jewel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jewel_params
      params.require(:jewel).permit(:image, :collection, :name, :description, :price, :available, :collection_id)
    end
end
