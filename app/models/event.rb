class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_event
  belongs_to :city

  validates :name, presence: true
  validates :address, presence: true
  validates :date, presence: true
  validates :time, presence: true 

end
