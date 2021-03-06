class BlogsController < ApplicationController
   before_filter :load_blog, :only => [:show,:search_archieve,:dashboard,:manage,:edit]
   before_filter :require_blog_user ,:only=>[:edit,:dashboard,:manage]
  before_filter :admin_blog, :only => [:manage,:destroy]
  def index
   
     @blogs = Blog.find(:all)
  
  end
  
  def show
    @blog = @current_blog
    @articles = @current_blog.articles.is_publish_eq(true).paginate(:page => params[:page],:per_page => 1)
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      flash[:notice] = "Successfully created blog."
      redirect_to @blog
    else
      render :action => 'new'
    end
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      flash[:notice] = "Successfully updated blog."
      redirect_to @blog
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    
    if current_user.super_admin
      if !@blog.users.first.super_admin
        @blog.destroy
        flash[:notice] = "Successfully destroyed blog."
      end  
    else
     flash[:notice] = "You Are Not Authorize."
    end
    redirect_to blogs_url
  end
  def search_archieve
    @blog = @current_blog
    @articles = @current_blog.articles.is_publish_eq(true).archieve_date_eq(params[:archieve_date]).paginate(:page => params[:page],:per_page => 1)
   # redirect_to blog_root_url(:subdomain => @blog.subdomain)
  end
  def dashboard
    @blog = @current_blog
    @articles = @blog.articles
    @comments = @blog.comments
    @categories = @blog.categories
  end
  def manage
    @blogs = Blog.all
    
  end
end
