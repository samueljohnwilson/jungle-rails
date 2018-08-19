class ReviewsController < ApplicationController

  #before_action :authenticate_user, only: [:create, :destroy]

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to [:products]
    else
      redirect_to root_path
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back
  end

  def review_params
    params.require(:review).permit(:description, :rating, :user_id, :product_id)
  end

end