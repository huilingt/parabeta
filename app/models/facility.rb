class Facility < ApplicationRecord
  belongs_to :category
  has_many :opening_hours
  has_many :rating_type_categories, through: :category
  has_many :rating_types, through: :rating_type_categories
  has_many :facility_cuisines, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # has_one_attached :photo



  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
    tsearch: { prefix: true }
    }

  def background_photo_url
    case facility.category.name
    when "Restaurants"
      asset_path("restaurants_bg.png")
    end
  end
end
