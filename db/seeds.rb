# Admin user
admin = User.find_or_create_by!(email_address: "admin@example.com") do |u|
  u.password = "password123"
end
puts "Admin user: admin@example.com / password123"

# Blog posts
3.times do |i|
  Post.find_or_create_by!(title: "Sample Post #{i + 1}") do |p|
    p.body = "This is the content for sample post #{i + 1}. Replace this with your own content."
    p.published = true
    p.published_at = (3 - i).days.ago
  end
end

Post.find_or_create_by!(title: "Draft Post") do |p|
  p.body = "This is a draft post that won't appear on the public blog."
  p.published = false
end
puts "Created #{Post.count} blog posts"

# Podcast episodes
[
  { title: "Episode 1: Getting Started", description: "An introduction to the podcast and what to expect.", platform: "Spotify" },
  { title: "Episode 2: Finding Your Path", description: "A conversation about discovering your purpose.", platform: "Apple Podcasts" },
  { title: "Episode 3: Building Momentum", description: "How to keep going when things get tough.", platform: "YouTube" }
].each_with_index do |attrs, i|
  PodcastEpisode.find_or_create_by!(title: attrs[:title]) do |ep|
    ep.description = attrs[:description]
    ep.embed_url = "https://open.spotify.com/embed/episode/placeholder#{i + 1}"
    ep.platform = attrs[:platform]
    ep.published_at = (3 - i).weeks.ago
  end
end
puts "Created #{PodcastEpisode.count} podcast episodes"

# Consultation topics
discovery = ConsultationTopic.find_or_create_by!(name: "Discovery Call") do |t|
  t.description = "A free 15-minute introductory call to discuss your needs and see if we're a good fit."
  t.price_cents = 0
  t.duration_minutes = 15
end

strategy = ConsultationTopic.find_or_create_by!(name: "Strategy Session") do |t|
  t.description = "A focused 45-minute session to develop a personalized action plan."
  t.price_cents = 9900
  t.duration_minutes = 45
end

deep_dive = ConsultationTopic.find_or_create_by!(name: "Deep Dive Consultation") do |t|
  t.description = "A comprehensive 90-minute session for in-depth guidance and support."
  t.price_cents = 19900
  t.duration_minutes = 90
end
puts "Created #{ConsultationTopic.count} consultation topics"

# Time slots (next 2 weeks)
[discovery, strategy, deep_dive].each do |topic|
  5.times do |i|
    start_time = (i + 1).days.from_now.change(hour: [9, 11, 14, 16, 10][i])
    TimeSlot.find_or_create_by!(
      consultation_topic: topic,
      starts_at: start_time
    ) do |ts|
      ts.ends_at = start_time + topic.duration_minutes.minutes
      ts.booked = false
    end
  end
end
puts "Created #{TimeSlot.count} time slots"

puts "\nSeed complete!"
