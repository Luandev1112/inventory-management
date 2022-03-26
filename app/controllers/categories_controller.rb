class CategoriesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :get_category_by_id, only: [:edit, :show, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, flash: { success: "Category created successfully." }
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to @category, flash: { success: "Category updated successfully." }
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_url, flash: { success: "Category deleted." }
  end

  private
    def category_params
      params.require(:category).permit(:name, :description)
    end

    def get_category_by_id
      @category = Category.find(params[:id])
    end
end
