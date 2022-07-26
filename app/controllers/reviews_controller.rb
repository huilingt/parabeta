class ReviewsController < ApplicationController

  def new
    @user = current_user
    @facility = Facility.find(params[:facility_id])
    @review = Review.new(user_id: current_user.id, facility_id: @facility.id)
  end

  def create
    @facility = Facility.find(params[:facility_id])
    @review = Review.new(review_params)
    @review.facility = @facility
    if @review.save
      review_rating_1 = ReviewRating.new(
        {
          rating: params[:Rating1],
          rating_type_id: params[:Type1],
          review_id: @review.id
        }
      )

      review_rating_2 = ReviewRating.new(
        {
          rating: params[:Rating2],
          rating_type_id: params[:Type2],
          review_id: @review.id
      }
      )

      review_rating_3 = ReviewRating.new(
        {
          rating: params[:Rating3],
          rating_type_id: params[:Type3],
          review_id: @review.id
        }
      )

      review_rating_4 = ReviewRating.new(
        {
          rating: params[:Rating4],
          rating_type_id: params[:Type4],
          review_id: @review.id
        }
      )

      # review_rating_1.save!
      # review_rating_2.save!
      # review_rating_3.save!
      # review_rating_4.save!

      if review_rating_1.save && review_rating_2.save && review_rating_3.save && review_rating_4.save
        redirect_to facility_path(@facility)
      else
        raise
        render :new
      end
    else
      raise
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])

    @facility = Facility.find(@review.facility_id)
    @user = User.find(@review.user_id)
    @rating_types = RatingType.all

    @comment = Comment.new

  end

  private

  def review_params
    params.require(:review).permit(:content, :photo, :user_id, :facility_id)
  end
end
