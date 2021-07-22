class BookmarkType < ApplicationRecord
  belongs_to :type
  belongs_to :bookmark
end
