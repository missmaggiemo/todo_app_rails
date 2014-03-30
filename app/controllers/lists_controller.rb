class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  # # GET /lists
  # # GET /lists.json
  # def index
  #   @lists = List.all
  # end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @todo_items = @list.todo_items
    @new_todo_item = TodoItem.new
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # # GET /lists/1/edit
  # def edit
  # end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list }
        format.json { render action: 'show', status: :created, location: @list }
      else
        format.html { render action: 'new' }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /lists/1
  # # PATCH/PUT /lists/1.json
  # def update
  #   respond_to do |format|
  #     if @list.update(list_params)
  #       format.html { redirect_to @list, notice: 'List was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @list.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find_by_id(params[:id])
      redirect_to root_url if @list.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params[:list]
    end
end
