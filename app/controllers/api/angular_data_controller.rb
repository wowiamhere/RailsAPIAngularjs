class Api::AngularDataController < ApplicationController
  before_action :set_rails_object, only: [:show, :edit, :update, :destroy]

  # GET /rails_objects
  # GET /rails_objects.json
  def index
    @rails_objects = RailsObject.all
  end

  # GET /rails_objects/1
  # GET /rails_objects/1.json
  def show
  end

  # GET /rails_objects/new
  def new
    @rails_object = RailsObject.new
  end

  # GET /rails_objects/1/edit
  def edit
  end

  # POST /rails_objects
  # POST /rails_objects.json
  def create
    @rails_object = RailsObject.new(rails_object_params)

    respond_to do |format|
      if @rails_object.save
        format.html { redirect_to @rails_object, notice: 'Rails object was successfully created.' }
        format.json { render :show, status: :created, location: @rails_object }
      else
        format.html { render :new }
        format.json { render json: @rails_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rails_objects/1
  # PATCH/PUT /rails_objects/1.json
  def update
    respond_to do |format|
      if @rails_object.update(rails_object_params)
        format.html { redirect_to @rails_object, notice: 'Rails object was successfully updated.' }
        format.json { render :show, status: :ok, location: @rails_object }
      else
        format.html { render :edit }
        format.json { render json: @rails_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rails_objects/1
  # DELETE /rails_objects/1.json
  def destroy
    @rails_object.destroy
    respond_to do |format|
      format.html { redirect_to rails_objects_url, notice: 'Rails object was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rails_object
      @rails_object = RailsObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rails_object_params
      params.fetch(:rails_object, {})
    end
end
