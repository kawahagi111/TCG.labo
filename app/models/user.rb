class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :games
  has_one_attached :image

  def liked_by?(tweet_id)
    likes.where(tweet_id: tweet_id).exists?
  end

  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  with_options presence: true do
    validates :nickname, length: {maximum: 25}   
    validates :name
    validates :profile
  end
end
