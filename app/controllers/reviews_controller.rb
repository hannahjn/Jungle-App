class ReviewsController < ApplicationController

before_action :current_user, only: [:create]

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product_id = @product.id
    @review.user = current_user

    @review.save!
    redirect_to :back
  end
end

private

def review_params
  params.require(:review).permit(:rating, :description)
end

