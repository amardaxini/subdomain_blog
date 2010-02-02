class ArticlesController < ApplicationController
 before_filter :load_blog
 before_filter :require_blog_user,:except=>[:index,:show,:search]
  
  def index
 
    @articles = @current_blog.articles.is_publish_eq(true).paginate(:page => params[:page],:per_page => 1)
    @comments = @current_blog.comments
    @categories =  @current_blog.categories
  end
  
  def show

    @article = @current_blog.articles.id_eq(params[:id]).is_publish_eq(true).first
    @comment = @article.comments.new unless @article.blank?
  end
  
  def new
    @article = @current_blog.articles.build
     @comments = @current_blog.comments
    @categories =  @current_blog.categories
  end
  
  def create
    @article = @current_blog.articles.build(params[:article])
    @article.author_name = current_user.name
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to dashboard_blog_path(@current_blog)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @article = @current_blog.articles.find(params[:id])
     @comments = @current_blog.comments
    @categories =  @current_blog.categories
  end
  
  def update
    @article = @current_blog.articles.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "Successfully updated article."
      redirect_to dashboard_blog_path(@current_blog)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @article = @current_blog.articles.find(params[:id])
    @article.destroy
    flash[:notice] = "Successfully destroyed article."
    redirect_to dashboard_blog_path(@current_blog)
  end
  def add_categories
    @article = @current_blog.articles.find(params[:id])
    @categories  =  @current_blog.categories
    
  end
  def save_categories
    @article = @current_blog.articles.find(params[:id])
    @article.categories.delete_all
    params[:category_ids].each do |category_id|
      #category = @current_blog.categories.find(category_id)
       @article.category_articles.create(:category_id=>category_id)
    end
    redirect_to edit_article_path(@article)
  end
  def search
  search = params[:search]
  @articles = @current_blog.articles.is_publish_eq(true).content_like(search).paginate(:page => params[:page],:per_page => 1)
  
  
    
  end
end
