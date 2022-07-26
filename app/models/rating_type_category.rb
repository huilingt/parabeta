class RatingTypeCategory < ApplicationRecord
  belongs_to :rating_type
  belongs_to :category
end
