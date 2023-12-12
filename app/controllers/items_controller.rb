class ItemsController < ApplicationController
  #GET all the data
  def index
    @items=Item.where(deleted_at: nil)
    @recycleBin=Item.where.not(deleted_at: nil)
    @allItems=Item.all
  end
  #GET a specific item
  def show
    @item=Item.find(params[:id])
  end
  # Adding a new data
  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end
  #Edit
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item=Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #Delete data
  def destroy
    @item=Item.find(params[:id])
    @item.destroy

    redirect_to root_path, status: :see_other
  end
  #Soft Delete
  def soft_delete
    @item=Item.find(params[:id])
    if @item.update(deleted_at: Time.now + Time.zone_offset('EST'))
      redirect_to @item
    else
      render :edit
    end
  end
  #Restore
  def restore
    @item=Item.find(params[:id])
    if @item.update(deleted_at: nil)
      redirect_to @item
    else
      render :edit
    end
  end

  private
    def item_params
      params.require(:item).permit(:name).merge(deleted_at: nil)
    end
end
