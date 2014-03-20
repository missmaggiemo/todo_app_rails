class AddListIdToTodoItem < ActiveRecord::Migration
  def change
    add_column :todo_items, :list_id, :integer
    add_index :todo_items, [:list_id, :created_at]
  end
end
