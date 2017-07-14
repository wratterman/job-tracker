class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You created #{@category.name}"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs
  end

  def edit
    @category
  end

  def update
    if @category.update(category_params)
      flash[:success] = "You updated #{@category.name}"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    flash[:success] = "#{category.name} was deleted!"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
