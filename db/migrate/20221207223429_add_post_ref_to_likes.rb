class AddPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :post_id, :integer
    add_reference :likes, :post, null: false, foreign_key: true
  end
end
