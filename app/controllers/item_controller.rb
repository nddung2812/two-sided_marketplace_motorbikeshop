class ItemController < ApplicationController
  def page
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end
end
