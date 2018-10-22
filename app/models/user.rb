class User < ApplicationRecord
  before_save { self.email.downcase! } #文字を全て小文字に変換する
  validates :name, presence: true, length: { maximum: 50 } #nameはカラは許さず、長さは50文字以内
  validates :email, presence: true, length: { maximum: 255 }, #emailはカラは許さず、長さは255文字以内
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false } #重複を許さない。case_sensitiveで大文字と小文字を区別しない
  has_secure_password #password_digestカラムを用意し、モデルファイルにhas_secure_passwordを記述する
  
  has_many :microposts
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  has_many :likes
  has_many :microposts, through: :likes, source: :micropost
  
  def follow(other_user)
    unless self == other_user #フォローしようとしているother_userが自分自身ではないかを検証
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def feed_microposts
    Micropost.where(user_id: self.following_ids + [self.id])
  end
end
