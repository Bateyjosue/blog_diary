class AddUserToLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :author_id, :integer
    add_reference :likes, :author, index: true
    add_foreign_key :likes, :users, column: :author_id
  end
end
