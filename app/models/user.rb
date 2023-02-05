class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :historys

  with_options presence: true do
    validates :nickname, :birthday
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'は全角ひらがな、全角カタカナ、漢字で入力して下さい' }
    validates :read_last, :read_first, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい' }
  end
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
  validates :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
end
