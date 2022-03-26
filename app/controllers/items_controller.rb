class ItemsController < ApplicationController
  include ApplicationHelper
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :get_item_by_id, only: [:edit, :update, :show, :manage_item_stock, :update_stock]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item_data = item_params.merge(in_stock: item_params[:total_stock])
    @item = Item.new(item_data)
    if @item.save
      redirect_to @item, flash: { success: "Item created successfully." }
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @brand_name = @item.brand_id.nil? ? "<Brand N/A>" : Brand.find(@item.brand_id).name
    @category_name = @item.category_id.nil? ? "<Category N/A>" : Category.find(@item.category_id).name
  end

  def update
    previous_quantity = @item.total_stock
    if((item_params[:total_stock].to_i - previous_quantity + @item.in_stock) < 0)
      redirect_to edit_item_path(@item), flash: { warning: "Currently more items are alloted than entered values." }
    elsif @item.update_attributes(item_params)
      redirect_to @item, flash: { success: "Item updated successfully." }
      @item.in_stock += (@item.total_stock - previous_quantity)
    else
      render 'edit'
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to items_url, flash: { success: "Item deleted." }
  end

  def allotments
    @allotments = Allotment.where(item_id: [params[:id]])
  end

  private
    def item_params
      params.require(:item).permit(:name, :category_id, :brand_id, :price, :quantity, :price, :total_stock, :minimum_required_stock, :procurement_time_in_weeks)
    end

    def get_item_by_id
      @item = Item.find(params[:id])
    end
end
