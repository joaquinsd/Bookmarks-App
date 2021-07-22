class Bookmark < ApplicationRecord
  has_many :bookmark_categories, dependent: :destroy
  has_many :categories, through: :bookmark_categories, dependent: :destroy

  has_many :bookmark_types, dependent: :destroy
  has_many :types, through: :bookmark_types, dependent: :destroy

  def category_list
    categories.map { |w| [w.name] }.join(', ')
  end

  def type_list
    types.map(&:name).join(', ')
  end

end
