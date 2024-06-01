class CommentsController < ApplicationController

  before_action :require_user
  before_action :require_owner, only: [:destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def require_owner
    @comment = Comment.find(params[:id])
    unless @comment.user_id == current_user.id
      redirect_to root_path, alert: "You are not authorized to delete this comment"
    end
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if @comment.update(comment_params)
      @comment.update(updated_at: Time.now)
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to article_path(@article), status: :see_other
    else
      redirect_to root_path, alert: "You are not authorized to delete this comment"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
