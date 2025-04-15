# app/controllers/api/v1/reviews_controller.rb
class Api::V1::ReviewsController < ApplicationController
  before_action :set_landmark
  
  # GET /api/v1/landmarks/:landmark_id/reviews
  def index
    @reviews = @landmark.reviews
    render json: @reviews
  end
  
  # GET /api/v1/landmarks/:landmark_id/reviews/:id
  def show
    @review = @landmark.reviews.find(params[:id])
    render json: @review
  end
  
  # POST /api/v1/landmarks/:landmark_id/reviews
  def create
    @review = @landmark.reviews.new(review_params)
    
    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /api/v1/landmarks/:landmark_id/reviews/:id
  def update
    @review = @landmark.reviews.find(params[:id])
    
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /api/v1/landmarks/:landmark_id/reviews/:id
  def destroy
    @review = @landmark.reviews.find(params[:id])
    @review.destroy
    head :no_content
  end
  
  private
  
  def set_landmark
    @landmark = Landmark.find(params[:landmark_id])
  end
  
  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
