class AddPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :post_id, :integer
    add_reference :likes, :post, index: true
    add_foreign_key :likes, :posts, column: :post_id
  end
end
