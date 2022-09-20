class PostsController < ApplicationController
  layout "bulletin"
  
  def index
    @posts = Post.limit(8).order(created_at: "DESC")
  end

  def show
    @post = Post.select("title, body, full_name", "posts.created_at").joins(:user).find(params[:id])
  end

  def create
    user_id = User.find_by("full_name = ?", params[:author]).id
    @post = Post.create(post_params user_id)
    if @post.errors.any?
      flash[:errors] = @post.errors.full_messages
    else
      flash[:success] = "Post successfully created!"
    end
    redirect_to "/bulletin"
  end

  private
    def post_params user_id
      post = params.require(:post).permit(:title, :body)
      post[:user_id] = user_id
      post
    end
end
