# db/seeds.rb

puts "Seeding Landmarks..."

# Clear existing data to avoid duplicates
Review.destroy_all
Landmark.destroy_all

landmarks = Landmark.create!([
  {
    name: "Two Lovers Point (Puntan Dos Amåntes)",
    description: "A famous cliffside lookout in Tumon known for its tragic local legend and stunning views of the Philippine Sea and Tumon Bay.",
    image_url: "http://www.puntandosamantes.com/",
    location: "Tumon"
  },
  {
    name: "Plaza de España",
    description: "Historic site in the heart of Hagåtña containing structures from the Spanish colonial era, including the Chocolate House, Azotea, and remnants of the Governor's Palace.",
    image_url: "https://en.wikipedia.org/wiki/Plaza_de_Espa%C3%B1a_(Hag%C3%A5t%C3%B1a)",
    location: "Hagåtña"
  },
  {
    name: "Mount Lamlam",
    description: "The highest peak on Guam, offering panoramic views. Culturally significant and a popular hiking destination located in the southern part of the island.",
    image_url: "https://en.wikipedia.org/wiki/Mount_Lamlam",
    location: "Agat / Umatac"
  },
  {
    name: "Sigua Falls",
    description: "A beautiful waterfall cascading into a large freshwater pool, accessible via a hike through central Guam's jungle terrain.",
    image_url: "https://www.alltrails.com/trail/guam/upper-sigua-falls",
    location: "Yona"
  }
])

puts "Finished seeding #{Landmark.count} landmarks."

puts "Seeding Reviews..."

# Add reviews for each landmark
landmarks.each do |landmark|
  # Add 2-3 reviews per landmark
  rand(2..3).times do
    landmark.reviews.create!(
      rating: rand(1..5),
      comment: [
        "Beautiful place to visit!",
        "Highly recommend this landmark.",
        "A must-see when in Guam.",
        "The views are breathtaking.",
        "Great cultural experience.",
        "Worth the trip.",
        "Loved learning about the history.",
        "Perfect spot for photos."
      ].sample
    )
  end
end

puts "Finished seeding #{Review.count} reviews."
