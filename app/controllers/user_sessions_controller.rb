class UserSessionsController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
 #   debugger
    @current_blog = Blog.find_by_subdomain(current_subdomain)
    if @user_session.save
    
      if  @current_blog.users.include?(@user_session.record)
        flash[:notice] = "Login successful!"
      else
        flash[:notice] = "You are not authorized user!"
        @user_session.destroy
      end  
      redirect_back_or_default blog_root_url
    else
      render :action => :new
    end
  end
  
  def destroy

    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default blog_root_url
  end
  
end
