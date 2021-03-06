# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
 blog = Blog.create(:name=>'RailsPress',:subdomain=>'railspress',:description=>'This is RailsPress Blog')
 user = blog.users.create(:login=>'admin',:name=>'admin',:password=>'Admin123!',:password_confirmation=>'Admin123!',:super_admin=>true)
 
 article= blog.articles.create(:name=>"Generate PDf Using Rails",:content=>"<h2>Rails Pdf Plugin act_as_flying_saucer</h2>
There are various ways to generate pdf documents in any language.In Rails we can use prawn library ,HtmlDoc,PrinceXml  and many other library,using their api we can generate pdf  document.Basically  the primary goal is converting HTML web pages to PDF Document,without much changing existing CSS and HTML.

Using the<a href='https://xhtmlrenderer.dev.java.net/' target='_blank'> Flying Saucer Project</a> we can achieve this.we can convert  HTML + CSS to PDF documents without much changing HTML and CSS. It also support CSS  2 and many properties of CSS 3 for  printing Header,Footer,Page Number,Paginated Tables and many more.This Project is built on Java so Java is required on system.

Lets Start How to generate PDF Using Flying Saucer.

[code lang='ruby']
 script/plugin install git@github.com:amardaxini/acts_as_flying_saucer.git
[/code]

This Plugin forked From

[code lang='html']http://github.com/dagi3d/acts_as_flying_saucer[/code]

Which has older version of flying saucer project.

Next Step after installing plugin add <strong>flying_saucer.rb </strong> file at <strong>config/initializers</strong>.

[code lang='ruby']

ActsAsFlyingSaucer::Config.options = {
:java_bin => '/usr/bin/java',          # java binary
:classpath_separator => ':',  # classpath separator. unixes system use ':' and windows ';'
:tmp_path => '/tmp',          # path where temporary files will be stored
}

[/code]

After Setting Java path , classpath separator and tmp path now do following step.

[code lang='ruby']
class PdfController < ActionController::Base
  acts_as_flying_saucer

  def generate_pdf
    render_pdf :template => 'pdf/pdf_template'
  end
end
  render_pdf :file=>'pdf/generate_pdf.html.erb'
  render_pdf :template=>'pdf/generate_pdf.pdf.erb',
             :send_file => { :filename => 'pdfdoc.pdf' }
[/code]

Add act_as_flying_saucer to controller then render_pdf.There are various ways to render pdf using '<strong>template</strong>' or '<strong>file</strong>',<strong>:send_file</strong> option use to send pdf file to client side.if we are using any <strong>external css</strong> file then this css shoulda have <strong>medi</strong>a option as<strong> 'print'</strong>.

[code lang='ruby']

<%= stylesheet_link_tag 'pdf' ,:media=>'print' %>

[/code]

If pdf containing images which generate on the fly.so instad of using

[code lang='ruby']<%= image_tag %>[/code]

use

[code lang='html'] <img src=" " >[/code]

Before rendering PDF validate HTML,like whether all tags are close properly or not.otherwise it gives an parse error.

Now You are ready to Generate PDF. Hurray!!!!!!!!!

How to generate Header, Footer,Page Number and Automation Of HTML Validation will be discussed in next post.",:author_name=>"admin",:is_publish=>true,:user_id=>user.id)
 
