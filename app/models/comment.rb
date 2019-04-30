class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :description, presence: true,allow_blank: false
end
