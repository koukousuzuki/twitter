class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User' #userクラスを参照するものだと明記
end
