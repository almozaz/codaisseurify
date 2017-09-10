class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
