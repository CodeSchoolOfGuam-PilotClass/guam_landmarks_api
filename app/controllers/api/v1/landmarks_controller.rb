# app/controllers/api/v1/landmarks_controller.rb
class Api::V1::LandmarksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /api/v1/landmarks
  # http :3000/api/v1/landmarks
  def index
    @landmarks = Landmark.all
    render json: @landmarks
  end

  # GET /api/v1/landmarks/:id
  # http :3000/api/v1/landmarks/1
  def show
    @landmark = Landmark.find(params[:id])
    # Include reviews, ordered newest first
    render json: @landmark.as_json(include: { reviews: { methods: [], order: { created_at: :desc } } })
  end

  # POST /api/v1/landmarks
  # http POST :3000/api/v1/landmarks \
  #   landmark[name]='Fort Soledad' \
  #   landmark[description]='Historic Spanish fort' \
  #   landmark[image_url]='https://example.com/fort.jpg' \
  #   landmark[location]='Umatac'
  def create
    @landmark = Landmark.new(landmark_params)

    if @landmark.save
      render json: @landmark, status: :created # status 201 Created
    else
      render json: @landmark.errors, status: :unprocessable_entity # status 422
    end
  end

  # PATCH/PUT /api/v1/landmarks/:id
  # http PATCH :3000/api/v1/landmarks/1 \
  #   landmark[name]='Updated Name' \
  #   landmark[description]='Updated description'
  def update
    @landmark = Landmark.find(params[:id])

    if @landmark.update(landmark_params)
      render json: @landmark
    else
      render json: @landmark.errors, status: :unprocessable_entity # status 422
    end
  end

  # DELETE /api/v1/landmarks/:id
  # http DELETE :3000/api/v1/landmarks/1
  def destroy
    @landmark = Landmark.find(params[:id])
    @landmark.destroy
    head :no_content # status 204 No Content - Standard practice for successful delete
  end

  private

  # Only allow a list of trusted parameters through.
  def landmark_params
    params.require(:landmark).permit(:name, :description, :image_url, :location)
  end

  # Optional: Method to handle record not found errors
  def record_not_found
    render json: { error: "Landmark not found" }, status: :not_found # status 404
  end
end
