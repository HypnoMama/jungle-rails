class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product, presence: true
  # validates :user_id, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :rating, numericality: { greater_than: 0, less_than: 6}
end
