class PagesController < ApplicationController
  def home
  	@posts = Blog.all
  	@skills = Skill.all
  	# call concern to manage user name - available in the view
  	@user_name = user_name
  end

  def about
    @page_title = 'About Steve'
  end

  def contact
    @page_title = 'Contact me'
  end

  def location
    @time = Time.now
    @location = "Earsham"
  end
end
