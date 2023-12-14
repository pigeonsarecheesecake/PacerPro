class ItemsController < ApplicationController
  # Index using scopes
  def index
    @items=Item.items_without_soft_delete
    @recycleBin=Item.recycle_bin
    @allItems=Item.all_items
  end

  # Get a specific item
  def show
     @item=Item.unscoped.find(params[:id])
  end

  # Adding a new item
  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Delete data
  def destroy
    @item=Item.unscoped.find(params[:id])
    @item.destroy

    redirect_to root_path, status: :see_other
  end

  # Tasks Soft Delete and Restore
  def soft_delete
    @item=Item.find(params[:id])
    @item.soft_delete

    redirect_to root_path
  end

  # Restore
  def restore
    @item=Item.unscoped.find(params[:id])
    @item.restore

    redirect_to root_path
  end

  private
    def item_params
      params.require(:item).permit(:name).merge(deleted_at: nil)
    end
end
