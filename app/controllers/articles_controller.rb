#
class ArticlesController < ApplicationController
  def index
    render json: Article.all
  end

  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    Article.update(params[:id], article_params)
  end

  def destroy
    Article.destroy(params[:id])
  end

  private

  def article_params
    params.require(:article)
          .permit(:title, :content)
  end
end
