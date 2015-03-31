# map states to abbreviation
states = {
	'Oregon' => 'OR',
	'Florida' => 'FL',
	'California' => 'CA',
	'New York' => 'NY',
	'Michigan' => 'MI',
	'Colorado' => 'CO'
}

# Create some states with cities.
cities = {
	'CO' => 'Fort Collins',
	'CA' => 'San Francisco',
	'MI' => 'Detroit',
	'FL' => 'Jacksonville'
}

cities['NY'] = 'New York'
cities['OR'] = 'Portland'

#put out some cities
puts '-' * 10
puts "NY state has #{cities['NY']}"
puts "OR state has #{cities['OR']}"

#put out some states
puts '-' * 10
puts "Michigan's abbreviation is: #{states['Michigan']}"
puts "Florida's abbreviation is: #{states['Florida']}"

# another way
puts '-' * 10
puts "Michigan has #{cities[states['Michigan']]}"
puts "Florida has #{cities[states['Florida']]}"

# puts every state abbreviation
puts '-' * 10
states.each do |state, abbrev|
  puts "#{state} is abbreviated #{abbrev}"
end

# puts every city in state
puts '-' * 10
cities.each do |abbrev, city|
	puts "#{abbrev} has the city #{city}"
end

#Both at the same time
puts '-' * 10
states.each do |state, abbrev|
	city = cities[abbrev]
	puts "#{state} is abbreviated #{abbrev} and has city #{city}"
end


puts '-' * 10
state = states['Texas']

if !state
	puts "sorry , no Texas"
end

city = cities['TX']
city ||= 'Does not exist'
puts "The city for the state 'TX' is #{city}"
