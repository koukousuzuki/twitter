class User < ApplicationRecord
  before_save { self.email.downcase! } #文字を全て小文字に変換する
  validates :name, presence: true, length: { maximum: 50 } #nameはカラは許さず、長さは50文字以内
  validates :email, presence: true, length: { maximum: 255 }, #emailはカラは許さず、長さは255文字以内
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false } #重複を許さない。case_sensitiveで大文字と小文字を区別しない
  has_secure_password #password_digestカラムを用意し、モデルファイルにhas_secure_passwordを記述する
  
  has_many :microposts
end
