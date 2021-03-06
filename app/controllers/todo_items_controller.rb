class TodoItemsController < ApplicationController
  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]
  before_action :set_list_new, only: [:new]
  before_action :set_list, only: [:edit, :update, :destroy]


  # GET /todo_items
  # GET /todo_items.json
  def index
    @todo_items = TodoItem.all
  end

  # GET /todo_items/1
  # GET /todo_items/1.json
  def show
  end

  # GET /todo_items/new
  def new
    @todo_item = TodoItem.new
  end

  # GET /todo_items/1/edit
  def edit
  end

  # POST /todo_items
  # POST /todo_items.json
  def create
    @todo_item = TodoItem.new(todo_item_params)

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to list_path(@todo_item.list_id) }
        format.json { render action: 'show', status: :created, location: @todo_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_items/1
  # PATCH/PUT /todo_items/1.json
  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to @list }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_items/1
  # DELETE /todo_items/1.json
  def destroy
    @todo_item.destroy
    render json: {}, status: :no_content
  end

  def remove_all
    @todo_items = TodoItem.all
    @todo_items.each do |item|
        item.destroy()
     end
    flash[:notice] = "All todo items have been deleted."
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_item
      @todo_item = TodoItem.find(params[:id])
    end

    def set_list_new
      @list = List.find(params[:id])
    end

    def set_list
      @list = List.find_by_id(@todo_item.list_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_item_params
      params.require(:todo_item).permit(:description, :complete, :list_id, :notes)
    end
end
