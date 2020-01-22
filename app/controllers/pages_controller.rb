class PagesController < ApplicationController
  def home
  	@posts = Blog.all
  	@skills = Skill.all
  	# call concern to manage user name - available in the view
  	@user_name = user_name
  end

  def about
    @page_title = 'About Once More Ltd'
  end

  def contact
    @page_title = 'Contact us!'
  end

  def location
    @time = Time.now
    @location = "Earsham"
  end

  def privacy
    @page_title = "Your Privacy Notice"
  end
end
