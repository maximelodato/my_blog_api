# app/controllers/comments_controller.rb

class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_article
    before_action :set_comment, only: %i[update destroy]
    before_action :authorize_user!, only: %i[update destroy]
  
    def index
      @comments = @article.comments
      render json: @comments
    end
  
    def create
      @comment = @article.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        render json: @comment, status: :created, location: article_comments_url(@article)
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    # ...
  
    private
  
    def set_article
      @article = Article.find(params[:article_id])
    end
  
    # ...
  end
  