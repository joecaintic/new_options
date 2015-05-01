require 'faker'

# Create Posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )  
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

unique_post = [
{title: "A Unique Post",
body: "A unique body"}]

unique_post.each do |text| 
  Post.where(text).first_or_create
  end

unique_comment = [
{body: "A Unique Comment", post: posts.sample}]

unique_comment.each do |comment|
  Comment.where(comment).first_or_create
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"