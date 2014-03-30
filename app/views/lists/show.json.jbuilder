json.list @list, :id, :created_at, :updated_at
json.items(@todo_items) do |todo_item|
  json.extract! todo_item, :id, :description, :complete, :notes, :list_id
  json.url todo_item_url(todo_item, format: :json)
end
