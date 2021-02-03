class Tweet < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :games

  validates :title,        presence: true
  validates :concept,      presence: true
  validates :image,        presence: true

  is_impressionable
end
