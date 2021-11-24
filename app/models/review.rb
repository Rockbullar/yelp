class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
  validate :rating_values

  private
  def rating_values
    if rating.present? && (0..5).include?(rating) == false
      errors.add(:rating, "must be between 0 to 5!")
    end
  end
end
