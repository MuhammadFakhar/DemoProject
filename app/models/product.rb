class Product < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images
  validates :name,:price,:description,:quantity, presence: true
  validates :name, length:{minimum: 3,maximum: 20}
  validates :description, length:{minimum: 10,maximum: 50}
end
