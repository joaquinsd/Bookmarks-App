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
    children = Category.where(category_id: id)
    children.each do |child|
      subcategories.push(child)
      child.subcategories(subcategories)
    end
    subcategories
  end

  def subcategories_names
    children = Category.where(category_id: id)
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
    children = Category.where(category_id: id)
    subcategories = []
    children.each do |w|
      subcategories.push(w)
      w.subcategories(subcategories)
    end
    subcategories.each do |child|
      child.update_attribute(:public, public)
    end
  end

  def json_bookmarks
    all_bookmarks = []
    bookmarks.each do |bookmark|
      bookmark_hash = {}
      bookmark_hash[:id] = bookmark.id
      bookmark_hash[:title] = bookmark.name
      bookmark_hash[:url] = bookmark.url
      all_bookmarks << bookmark_hash
    end
    all_bookmarks
  end

  def json_subcategories()
    all_categories = []
    subcategories.each do |category|
      category_hash = {}
      category_hash[:id] = category.id
      category_hash[:title] = category.name
      category_hash[:direct_parent] = category.parent

      all_categories << category_hash
    end
    all_categories
  end

end
