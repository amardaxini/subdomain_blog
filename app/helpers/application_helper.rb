# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
 def clearing_span
    content_tag(:span, '', :class => 'clear')
  end
end
