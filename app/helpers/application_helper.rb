module ApplicationHelper
	def login_helper style = ""
		if current_user
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    else
      (link_to 'Log in', user_session_path, class: style) + 
      "  ".html_safe + 
      (link_to 'Register', new_user_registration_path, class: style)
    end
	end
	
	def source_helper
		if session[:source]
			greeting = "Thanks for visiting me from #{session[:source]}"
			content_tag(:p, greeting, class: "source-greeting")
		end
	end

	def copyright name, msg
		"&copy; #{Time.now.year} | <b>#{name}</b> | #{msg}".html_safe 
	end

	def bdc_copyright 
		copyright('Once More Ltd', 'All rights reserved') + " | Registered Office: 7 Hungate, Beccles NR34 9TB | Incorporation: ******* | " + (link_to 'Privacy', privacy_path).html_safe + " | Legal"
	end

	def nav_items
		[
			{
				url: root_path,
				title: 'Home'
			},
			{
				url: about_path,
				title: 'About'
			},
			{
				url: portfolios_path,
				title: 'Breaches'
			},
			{
				url: contact_path,
				title: 'Contact'
			},
			{
				url: blogs_path,
				title: 'Blog'
			},
			{
				url: privacy_path,
				title: 'Privacy'
			}
		]

	end

	def build_link url, title, style, tag
		"<#{tag}><a href='#{url}' class='#{style} #{active? url}'>#{title}</a></#{tag}>"
	end

	def nav_helper style, tag_type
		nav_links = ""
		nav_items.each do | item |
			nav_links << build_link(item[:url], item[:title], style, tag_type)
		end
		nav_links.html_safe
	end

	def active? path
		"active" if current_page? path
	end
end