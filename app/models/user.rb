class User < ApplicationRecord
  before_save { self.email = email.downcase } # 小文字に変換
  
  
  validates :name, presence: true, length: {maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # Rubyでは定数を定義する時は大文字のスネークケースで記述することが一般的
  validates :email, presence: true, length: {maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true # 一意性　他に同じデータがないという意味end
  has_secure_password
end