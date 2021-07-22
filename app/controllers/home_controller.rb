class HomeController < ApplicationController
  def index
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.all
    @categories = Category.where(public: true)
    @types = Type.all
  end
end
