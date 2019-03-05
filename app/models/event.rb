class Event < ApplicationRecord
  has_many :rsvps
  has_many :guests, :through => :rsvps, :source => :user
  belongs_to :city
  belongs_to :host, :class_name => "User"


  validates :name, presence: true
  validates :address, presence: true
  validates :date, presence: true
  validates :time, presence: true

end
