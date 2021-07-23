class Bookmark < ApplicationRecord
  has_many :bookmark_categories, dependent: :destroy
  has_many :categories, through: :bookmark_categories, dependent: :destroy

  has_many :bookmark_types, dependent: :destroy
  has_many :types, through: :bookmark_types, dependent: :destroy

  def category_list
    categories.includes(:bookmark_categories, :categories).map(&:name).join(', ')
  end

  def type_list
    types.includes(:bookmark_types, :bookmarks).map(&:name).join(', ')
  end

end
