class ItemController < ApplicationController
  def page
    @posts = Post.all
  end
end
