class ItemController < ApplicationController
  def page
    #implement search bar on item page using ransack gem
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end
end
