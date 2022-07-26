class Cuisine < ApplicationRecord
  has_many :facilities_cuisines, dependent: :destroy
end
