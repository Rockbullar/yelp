class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, presence: true
  validate :category_check

  private

  def category_check
    if category.present? && ["chinese", "italian", "japanese", "french", "belgian"].include?(category.downcase) == false
      errors.add(:category, "must be chinese, italian, japanese, french or belgian!")
    end
  end
end
