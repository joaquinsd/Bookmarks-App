class Category < ApplicationRecord
  has_many :bookmark_categories, dependent: :destroy
  has_many :bookmarks, through: :bookmark_categories, dependent: :destroy

  belongs_to :category, optional: true
  has_many :categories, dependent: :destroy

  def parent
    if category_id.nil?
      'None'
    else
      Category.find(category_id).name unless category_id.nil?
    end
  end

  def public_cat?
    if public?
      'Public'
    else
      'Private'
    end
  end

  def subcategories(subcategories = [])
    children = Category.where(category_id: id).includes(:category)
    children.each do |child|
      subcategories.push(child)
      child.subcategories(subcategories)
    end
    if children[0].nil?
      'None'
    else
      subcategories.map { |w| [w.name] }.join(', ')
    end
  end

  def bookmark_count
    bookmarks.count
  end

  def change_status
    update_attribute(:public, !public)
    children = Category.where(category_id: id).includes(:category)
    subcategories = []
    children.each do |w|
      subcategories.push(w)
      w.subcategories(subcategories)
    end
    subcategories.each do |child|
      child.update_attribute(:public, public)
    end
  end
end
