class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_user_product, only: [ :update, :edit, :destroy ]
  # GET /posts or /posts.json
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  # GET /posts/1 or /posts/1.json
  def show

    session = Stripe::Checkout::Session.create({
      payment_method_types: [
        'card',
      ],
      customer_email: current_user ? current_user.email : nil,
      line_items: [{
        price_data: {
          unit_amount: (@post.price * 100).to_i,
          currency: "aud",
          product_data: { 
            name: @post.name,
            description: @post.description
          }
        },
        quantity: 1,
      }],
      payment_intent_data: { 
        metadata: { 
          post_id: @post.id,
          user_id: current_user ? current_user.id : nil,
        }
      },
      mode: 'payment',
      success_url: "#{root_url}payments/success",
      cancel_url: "#{root_url}posts",
    })
    @session_id = session.id
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :description, :price, :used_vehicle, :make, :model, :user_id, :picture)
    end
end
