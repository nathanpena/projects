PROJECT_TITLES = 10.times.map { Faker::Internet.domain_word }

SPLIT = 0.4
OFFSET = PROJECT_TITLES.length * SPLIT

PROJECT_USERS = {
	'nathan@example.com' => PROJECT_TITLES[0, OFFSET],
	'mary@example.com' => PROJECT_TITLES[OFFSET..-1]
}

PROJECT_USERS.each do |email, projects|
	user = User.new(email: email, password: 'secret')
	projects.each { |title| user.projects.build(title: title)}
	user.save
	puts "Created #{projects} for #{user.email}"
end
