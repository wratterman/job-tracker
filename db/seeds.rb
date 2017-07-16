Comment.destroy_all
Contact.destroy_all
Job.destroy_all
Category.destroy_all
Company.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = ["Software Engineering", "Teaching", "Electrician", "Senior VP of Design"]
FULL_NAMES = ["Pablo Jimenez", "Alan Fredrikson", "Seymore Butts", "Alice Wunderlynd"]
POSITIONS = ["Manager", "Recruiter", "Director of Business Development", "Chief Technology Officer", "Janitor"]

cat_list = CATEGORIES.map do |name|
  Category.create!(name: name)
end

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample, category_id: cat_list.sample.id)
    puts "  Created #{company.jobs[num].title}"
  end
  rand(3).times do |num|
    company.contacts.create!(full_name: FULL_NAMES.sample, position: POSITIONS.sample, email: 'first_last@example.com')
    puts "  Created #{company.jobs[num].title}"
  end
end
