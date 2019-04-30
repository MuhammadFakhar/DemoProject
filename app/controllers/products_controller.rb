class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only:[:show,:edit,:update,:destroy]

  def index
    @products=current_user.products.order(created_at: :desc)
  end

  def new
    @product=Product.new
  end

  def create
    @product = current_user.products.build(product_params)

    if @product.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def show
    @comment=Comment.new
    @comments=@product.comments.order("created_at DESC")
  end

  def edit; end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price,:quantity,images:[])
  end

  def find_product
    @product=Product.find(params[:id])
  end
end
