class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true

  with_options presence: true do
    validates :first_name, :last_name,           format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください' }
    validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: 'は全角カナを使用してください' }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze, message: 'は半角英数を両方含む必要があります' }
    validates :password, format: { with: /\A[a-z0-9]+\z/i, message: 'は半角英数のみ定義できます' }
  end

  # with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください' } do
  #   validates :first_name
  #   validates :last_name
  # end

  # with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'は全角カナを使用してください' } do
  #   validates :first_name_kana
  #   validates :last_name_kana
  # end

  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }

  # VALID_PASSWORD_REGEX2 = /\A[a-z0-9]+\z/i
  # validates :password, format: { with: VALID_PASSWORD_REGEX2, message: 'は半角英数のみ定義できます' }

  has_many :items
  has_many :orders

end
