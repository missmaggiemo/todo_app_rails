class List < ActiveRecord::Base
  has_many :todo_items, dependent: :destroy
end
