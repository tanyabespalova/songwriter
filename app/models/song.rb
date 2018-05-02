class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :album
  has_many :comments, as: :commentable
end
