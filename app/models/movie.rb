class Movie < ApplicationRecord
  validates :title, presence: true
  validates :blurb, presence: true
  validates :date_released, presence: true
  validates :country_origin, presence: true
  validates :showing_start, presence: true
  validates :showing_end, presence: true

  has_many :reviews
end