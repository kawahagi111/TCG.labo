class Tweet < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :games

  with_options presence: true do
  validates :title, length: {maximum: 33}     
  validates :concept
  validates :image
  end
  
  is_impressionable
end
