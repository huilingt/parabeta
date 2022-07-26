class Review < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  has_many :comments, dependent: :destroy
  has_many :review_ratings, dependent: :destroy
  has_many :rating_types, through: :review_ratings
  has_one_attached :photo

  validates :content, :user_id, :facility_id, presence: true

  # validates :photo, attached: true

end
