class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new(list_id: params[:list_id])
  end

  def create
  	@item = Item.new(item_params)
      if @item.save
        redirect_to list_path(@item.list_id)
      else 
        render :new
      end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update
      redirect_to list_path(@items)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to items_path
    else
      redirect_to items_path(item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :priority, :completed, :list_id)
  end
end
