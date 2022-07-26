class ReviewRatingsController < ApplicationController

  def new
    @review = Review.new
    @wheelchair_review_rating = ReviewRating.new(rating_type_id: 1, review_id: @review.id)
    @staff_review_rating = ReviewRating.new(rating_type_id: 2, review_id: @review.id)
    @ambience_review_rating = ReviewRating.new(rating_type_id: 3, review_id: @review.id)
    @toilet_review_rating = ReviewRating.new(rating_type_id: 4, review_id: @review.id)
  end

end
