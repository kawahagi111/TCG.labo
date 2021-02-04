class Tweet < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :games

  is_impressionable 

  with_options presence: true do
   validates :title, length: {maximum: 32}     
   validates :concept
   validates :image
  end
end
