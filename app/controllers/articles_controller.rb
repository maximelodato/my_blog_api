class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]
  before_action :authorize_user!, only: %i[update destroy]

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
    @article.destroy
    head :no_content
  end

  private

  # Vérifie que l'utilisateur connecté est l'auteur de l'article
  def authorize_user!
    render json: { error: 'Non autorisé' }, status: :unauthorized unless @article.user == current_user
  end

  # Récupère l'article en fonction de l'ID fourni
  def set_article
    @article = Article.find_by(id: params[:id])
    render json: { error: 'Article introuvable' }, status: :not_found unless @article
  end

  # Filtre les paramètres autorisés
  def article_params
    params.require(:article).permit(:title, :content, :private)
  end
end
