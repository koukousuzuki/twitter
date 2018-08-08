class Micropost < ApplicationRecord
  belongs_to :user #UserとMicropostの一対多を表現している
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
