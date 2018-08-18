class ReviewsController < ApplicationController

  def create    
    @product = Product.find params[:product_id]
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    @review.save

    if @review.save
      redirect_to :back
    else 
      redirect_to :back
    end
  end

  def destroy
    # @product = Product.find params[:product_id]
    if Review.find(params[:id]).destroy
      flash[:notice] = "Review Deleted!"
      redirect_to :back
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
