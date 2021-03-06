# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all 

 # protect_from_forgery # :secret => '9346baedc099926e71cc3a3f39613aa6'
#  layout 'themes' 
   helper_method :current_user_session, :current_user,:check_blog_user?,:is_admin_blog?
  filter_parameter_logging :password, :password_confirmation
  private
  
  def load_blog
    @current_blog = Blog.find_by_subdomain(current_subdomain)
 
    if @current_blog.nil?
      flash[:error] = "Blog invalid"
      redirect_to root_url
    end
  end
  def admin_blog
    current_blog = Blog.find_by_subdomain(current_subdomain)
    if  !current_blog.blank? && current_blog.users.first.super_admin  
      @admin_blog = current_blog
     else
      flash[:error] = "Blog invalid"
      redirect_to root_url 
    end
  end
  def is_admin_blog?
    current_blog = Blog.find_by_subdomain(current_subdomain)
    return ((!current_blog.blank?) && (current_blog.users.first.super_admin))
     
  end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
    	unless current_user 
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to login_url
        return false
      end
    end
    def require_blog_user
     if !current_user
        store_location
       flash[:notice] = "You must be logged in to access this page"
       if !@current_blog.nil?
         redirect_to login_url
       else
         redirect_to blogs_path
       end 
        return false
      elsif !@current_blog.nil? && !@current_blog.users.include?(current_user)
        store_location
        flash[:notice] = "You are not authorized"
        redirect_to blog_root_url
        return false
      end
    end
    
    def check_blog_user?
    
      return ((!@current_blog.blank? && !current_user.blank? && @current_blog.users.include?(current_user)))
    end
    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to blog_root_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
