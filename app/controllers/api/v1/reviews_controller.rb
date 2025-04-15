# app/controllers/api/v1/reviews_controller.rb
class Api::V1::ReviewsController < ApplicationController
  before_action :set_landmark

  # POST /api/v1/landmarks/:landmark_id/reviews
  def create
    @review = @landmark.reviews.build(review_params)

    if @review.save
      render json: @review, status: :created # Return the created review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  private

  def set_landmark
    @landmark = Landmark.find(params[:landmark_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Landmark not found" }, status: :not_found
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
