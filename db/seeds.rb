3.times do |topic|
	Topic.create(title: "Topic #{topic}")
	puts "Topic #{topic} created"
end

10.times do |blog|
 	Blog.create!(
 		title: "My blog post #{blog}",
 		body: "A body for blog #{blog}. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
		topic_id: Topic.last.id 	
 	)
 	puts "Blog post #{blog} created"
end

5.times do |skill|
	Skill.create!(
		title: "Rails skill #{skill}",
		percent_utilised: 15
	)
	puts "Skill #{skill} created"
end

8.times do |portfolio_item|
	Portfolio.create!(
		title: "Portfolio title #{portfolio_item}",
		subtitle: "Ruby on Rails",
		body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
		main_image: "https://placehold.it/600x400",
		thumb_image: "https://placehold.it/350x200"
	)
	puts "Portfolio #{portfolio_item} created"
end

1.times do |portfolio_item|
	Portfolio.create!(
		title: "Portfolio new title #{portfolio_item}",
		subtitle: "Software engineering",
		body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
		main_image: "https://placehold.it/600x400",
		thumb_image: "https://placehold.it/350x200"
	)
	puts "Portfolio #{portfolio_item} created"
end

3.times do |technology|
	Portfolio.first.technologies.create(
		name: "Technology #{technology}"
	)
	puts "Technology #{technology} created"
end