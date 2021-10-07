class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください', allow_blank: true }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください', allow_blank: true }
    validates :nickname, length: { allow_blank: true, maximum: 20, message: 'は15文字以内で入力してください' }
    validates :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）で入力してください', allow_blank: true }
    validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）で入力してください', allow_blank: true }
    validates :birthday
  end

  # validates :password,
  #         format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字の両方を含めて半角で入力してください', allow_blank: true }, length: { maximum: 12 }
  # ASSOCIATION
  # has_many :items
  # has_many :buyers
end
