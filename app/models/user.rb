class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    # ひらがな、カタカナ、漢字のみを許可する
    validates :name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters"}
    # カタカナのみを許可する
    validates :name_reading, format: {with: /\A[ァ-ヶ]+\z/, message: "is invalid. Input full-width katakana characters"}
    # 半角英数字のみを許可する
    validates :nickname, format: {with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters"}
  end

  has_many :donations
end
