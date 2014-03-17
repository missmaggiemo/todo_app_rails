class StaticPagesController < ApplicationController

  def home
    @todo_item = TodoItem.last
  end


end
