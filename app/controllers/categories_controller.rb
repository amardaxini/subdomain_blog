class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.xml
  before_filter :load_blog
  before_filter :require_blog_user
  def index
    @categories = @current_blog.categories

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category =  @current_blog.categories.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category =  @current_blog.categories.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category =  @current_blog.categories.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category =  @current_blog.categories.new(params[:category])

    respond_to do |format|
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        format.html {redirect_to dashboard_blog_path(@current_blog) }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category =  @current_blog.categories.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = 'Category was successfully updated.'
        format.html { redirect_to dashboard_blog_path(@current_blog) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category =  @current_blog.categories.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(categories_url) }
      format.xml  { head :ok }
    end
  end
  
  def search_category_articles
    @category = @current_blog.categories.find(params[:id])
    @articles = @category.articles.publish(true).paginate(:page => params[:page],:per_page => 1)
  end
  
end
