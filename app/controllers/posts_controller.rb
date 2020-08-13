class PostsController < ApplicationController
  before_action :authenticate_account!, only: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :can_access?, except: [:show, :latest]
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  def latest
    @posts = Post.active
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  def latest
    @posts = Post.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '投稿が作成されました' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: '投稿が更新されました' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: '投稿が削除されました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def can_access?
    
    unless current_account
      redirect_to root_url, flash: { danger: "このページを表示するアクセス権がありません" }
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :url, :summary, :body, :image, :active, :name)
    end
  end
end
