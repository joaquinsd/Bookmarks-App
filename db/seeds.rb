# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Bookmark.destroy_all
Category.destroy_all
Type.destroy_all

3.times do
  @category = Category.create(
    name: Faker::Commerce.department(max: 1).humanize,
    public: Faker::Boolean.boolean
  )
  2.times do
    @subcategory = Category.create(
      name: Faker::Commerce.department(max: 1).humanize + ' ' + @category.name,
      public: Faker::Boolean.boolean,
      category_id: @category.id
    )
    2.times do
      Category.create(
        name: Faker::Commerce.department(max: 1).humanize + ' ' + @subcategory.name,
        public: Faker::Boolean.boolean,
        category_id: @subcategory.id
      )
    end
  end
end

10.times do
  Type.create(
    name: Faker::Hipster.word.humanize
  )
end

50.times do
  Bookmark.create(
    name: Faker::Hipster.sentence(word_count: 3),
    url: Faker::Internet.url
  )
end

bookmarks = Bookmark.all
categories = Category.all
types = Type.all

bookmarks.each do |bookmark|
  categ = rand(1..5)
  categ.times do
    BookmarkCategory.create!(bookmark_id: bookmark.id, category_id: categories.sample.id)
  end
  type = rand(1..5)
  type.times do
    BookmarkType.create!(bookmark_id: bookmark.id, type_id: types.sample.id)
  end
end

