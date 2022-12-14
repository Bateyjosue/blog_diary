class AddForeignKeyToComment < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :post_id, :integer
    remove_column :comments, :author_id, :integer

    add_reference :comments, :post, index: true
    add_reference :comments, :author, index: true

    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :posts, column: :post_id

  end
end
