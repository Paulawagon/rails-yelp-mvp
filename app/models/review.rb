class Review < ApplicationRecord
  belongs_to :restaurant
  RATING = Array(0..5)
  validates :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: Review::RATING,
    message: "%{value} from 0 to 5" }
  
end
