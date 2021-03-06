class CommentsController < ApplicationController
   before_filter :load_blog
   before_filter :load_article
   before_filter :require_blog_user,:except=>[:new,:create]
  def new
    @comment = @article.comments.new
  end
  
  def create
    @comment = @article.comments.new(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to article_path(@article)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @comment = @article.comments.find(params[:id])
  end
  
  def update
    @comment = @article.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to article_url(@comment.article_id)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to article_url(@comment.article_id)
  end
  private
  def load_article
    @article = @current_blog.articles.find(params[:article_id])
  end
end
