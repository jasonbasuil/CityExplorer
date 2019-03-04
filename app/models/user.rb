class User < ApplicationRecord
  has_many :user_cities
  has_many :cities, through: :user_city
  has_many :user_events
  has_many :events, through: :user_event

  validates :name, presence: true
  validates :email, uniqueness: true
end
