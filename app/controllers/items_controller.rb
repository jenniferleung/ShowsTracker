class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item_params = params.require(:item).permit(:name, :category, :is_complete, :episode, :description)
    @item = Item.create item_params
    if @item.save
      redirect_to items_path, notice: "Item created successfully"
    else
      flash[:alert] = "Item NOT created"
      render :new #new.html.erb
    end
  end

  def edit
    @item = Item.find params[:id]
  end

  def update
    @item = Item.find params[:id]
    item_params = params.require(:item).permit(:name, :category, :is_complete, :episode, :description)
    if @item.update item_params
      flash[:notice] = "Item updated successfully"
      redirect_to items_path
    else
      flash[:alert] = "Item FAILED to update"
      render :edit
    end
  end

  def destroy
    item = Item.find params[:id]
    item.destroy
    redirect_to items_path
  end
end
