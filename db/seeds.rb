u = User.new
u.first_name = 'John'
u.last_name = 'Doe'
u.email = 'helloworld@gmail.com'
u.password = '123456789'
u.birthdate = 20.years.ago
u.country = CS.countries.values[1 + rand(248)]
u.gender = 1

if !u.save
  puts u.errors
  debugger
  exit
end

u1 = User.new(first_name: 'Samuel', last_name: 'Jo')
u1.email = 'hello@gmail.com'
u1.password = '123456789'
u1.birthdate = 20.years.ago
u1.gender = 1
u1.country = CS.countries.values[1 + rand(248)]
puts u1.save

(1..50).each do |i|
  g = i % 2
  pwd = Faker::Internet.password
  u = User.new

  u.gender = g
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.email = Faker::Internet.email
  u.password_confirmation = pwd
  u.password = pwd
  u.country = CS.countries.values[1 + rand(248)]
  u.birthdate = Faker::Date.birthday
  u.save
  puts i
end

puts 'creating 10_000 posts'

# 10_000 posts
# 10.times do
  posts = []
  1_000.times do
    posts << {
      content: Faker::Lorem.paragraph(sentence_count: 40),
      user_id: 1 + rand(50)
    }
  end
  puts 'insering posts ...'
  Post.insert_all(posts)
# end

# User.counter_culture_fix_counts # ????
Post.counter_culture_fix_counts
# Comment.counter_culture_fix_counts
