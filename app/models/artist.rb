class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :albums
  has_and_belongs_to_many :genres
  has_many :comments, as: :commentable
end
