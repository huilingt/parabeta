class RatingType < ApplicationRecord
  has_many :review_ratings, dependent: :destroy
  has_many :rating_type_categories, dependent: :destroy
end
