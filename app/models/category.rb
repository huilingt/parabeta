class Category < ApplicationRecord
  has_many :facilities
  has_many :rating_type_categories
  has_many :rating_types, through: :rating_type_categories

end
