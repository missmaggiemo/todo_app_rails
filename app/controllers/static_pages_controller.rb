class StaticPagesController < ApplicationController

  def home
    @todo_items = TodoItem.all
  end


end
