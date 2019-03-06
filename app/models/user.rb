class User < ApplicationRecord
  has_secure_password

  has_many :user_cities
  has_many :cities, through: :user_city
  has_many :rsvps, :foreign_key => :guest_id
  has_many :attended_events, through: :rsvps, :source => :event
  has_many :hosted_events, :foreign_key => :host_id, :class_name => "Event"


  validates :first_name, presence: true
  validates :email, uniqueness: true
end
