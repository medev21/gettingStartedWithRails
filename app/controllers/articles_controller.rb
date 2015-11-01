class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def new
  end

  def create
    # @article = Article.create(params.require(:articles).permit(:title))
    # render plain: params[:article].inspect
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  def show
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def find_article
      @article = Article.find(params[:id])
    end
end
