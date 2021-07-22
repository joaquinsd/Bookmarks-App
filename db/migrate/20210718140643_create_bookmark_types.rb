class CreateBookmarkTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmark_types do |t|
      t.references :type, null: false, foreign_key: true
      t.references :bookmark, null: false, foreign_key: true

      t.timestamps
    end
  end
end
