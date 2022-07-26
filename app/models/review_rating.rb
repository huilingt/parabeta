class ReviewRating < ApplicationRecord
  belongs_to :rating_type
  belongs_to :review
end
