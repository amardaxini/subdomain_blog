module BlogsHelper
  def display_blog_name
    @current_blog.blank? ? "RailsPress" : @current_blog.name
  end

end
