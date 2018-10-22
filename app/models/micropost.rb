class Micropost < ApplicationRecord
  belongs_to :user #UserとMicropostの一対多を表現している

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :likes
  has_many :users, through: :likes, source: :user
end
