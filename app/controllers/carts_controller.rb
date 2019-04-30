class CartsController < ApplicationController
  before_action :authenticate_user!
  def create
    if current_user.cart.present?
      cart = current_user.cart
      cart[params[:id]]= {name: params[:name],"price"=>params[:price],"quantity"=>params[:quantity]}
    elsif current_user.present?
      cart = {}
      cart[params[:id]]= {"name"=>params[:name],
                                 "price"=>params[:price],"quantity"=>params[:quantity]}
    end
    current_user.update(cart: cart)
    redirect_to cart_path
  end

  def show
  end

  def edit
    @cart=current_user.cart
    @product = Product.find(params[:id])
  end

  def update
    cart=current_user.cart
  end

  def destroy
    cart = current_user.cart
    cart.delete(params[:id])
    current_user.update(cart: cart)
    redirect_to cart_path
  end
end
