class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @page_name = "Rails Based Blog - #{@post.header}"
    @page_description = @post.description
    @page_keywords = @post.formatted_tags
  end

  def new
    @authors = Author.all
    @post = Post.new
  end

  def create
    @authors = Author.all
    @post = Post.new(post_params)

    if @post.save
      redirect_to(posts_path, notice: 'The post was saved.') and return
    else
      render :new, error: 'The post was not saved.'
    end
  end

  private
  def post_params
    params[:post].permit(:header, :body, :subheader, :author_id)
  end
end
