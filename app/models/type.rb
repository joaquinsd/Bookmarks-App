class Type < ApplicationRecord
  has_many :bookmark_types, dependent: :destroy
  has_many :bookmarks, through: :bookmark_types, dependent: :destroy
end
