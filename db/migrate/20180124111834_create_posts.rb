class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :votes
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
