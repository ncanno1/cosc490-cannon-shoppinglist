class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy, :add_item, :add, :remove_item, :remove]
  before_action :set_item, only: [:remove_item, :remove]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @items = @list.items.all
  end

  def add_item
    @items = @list.items.all
    @item = Item.new
  end

  def add
    @item = Item.new(item_params)
    if @item.save
      @list.items << @item
      redirect_to list_add_item_path(@list)
    end
  end

  def remove_item
    @items = @list.items.all
  end

  def remove
    @list.items.delete(@item)
    redirect_to list_remove_items_path(@list)
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.items.delete_all
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    def set_item
      if params[:item_id] != nil
        @item = Item.find(params[:item_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title)
    end

    def item_params
      params.require(:item).permit(:name)
    end
end
