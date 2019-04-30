class CommentsController < ApplicationController
  before_action :find_comment, only:[:edit,:update,:destroy]
  def create
    @product=Product.find(params[:product_id])
    @comment=@product.comments.new(comment_params)
    @comment.user=current_user
    @comment.save!
  end

  def edit; end

  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:description,:user_id,:product_id)
  end

  def find_comment
    @product=Product.find(params[:product_id])
    @comment=@product.comments.find(params[:id])
  end

end
