class BrandsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :get_brand_by_id, only: [:edit, :update, :show]

  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to @brand, flash: { success: "Brand created successfully." }
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @brand.update_attributes(brand_params)
      redirect_to @brand, flash: { success: "Brand updated successfully." }
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    Brand.find(params[:id]).destroy
    redirect_to brands_url, flash: { success: "Brand deleted." }
  end

  private
    def brand_params
      params.require(:brand).permit(:name, :manufacturer, :manufacturer_email, :manufacturer_office)
    end

    def get_brand_by_id
      @brand = Brand.find(params[:id])
    end
end
