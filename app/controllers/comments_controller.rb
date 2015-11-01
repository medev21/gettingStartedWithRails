class CommentsController < ApplicationController
  before_action :find_article
  before_action :find_comment, only: [:destroy]
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

    def find_article
      @article = Article.find(params[:article_id])
    end

    def find_comment
      @comment = @article.comments.find(params[:id])
    end

end
