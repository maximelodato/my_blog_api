class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show update destroy ]

  # GET /articles
  def index
    @articles = Article.where(private: false)
    render json: @articles
  end

  # GET /articles/1
  def show
    if @article.private? && @article.user != current_user
      render json: { error: 'Non autorisé' }, status: :unauthorized
    else
      render json: @article
    end
  end
  

  # POST /articles
  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy!
  end

  private

    def authorize_user!
      render json: { error: 'Non autorisé' }, status: :unauthorized unless @article.user == current_user
      enddef authorize_user!
      render json: { error: 'Non autorisé' }, status: :unauthorized unless @article.user == current_user
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
