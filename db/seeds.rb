# db/seeds.rb

puts "Seeding Landmarks..."

Landmark.create!([
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

two_lovers = Landmark.find_by(name: "Two Lovers Point (Puntan Dos Amåntes)")
plaza = Landmark.find_by(name: "Plaza de España")
lamlam = Landmark.find_by(name: "Mount Lamlam")
sigua = Landmark.find_by(name: "Sigua Falls")

if two_lovers
  Review.create!([
    { landmark: two_lovers, rating: 5, comment: "Absolutely breathtaking view!" },
    { landmark: two_lovers, rating: 4, comment: "Nice spot, a bit crowded but worth it." }
  ])
end

if plaza
  Review.create!([
    { landmark: plaza, rating: 4, comment: "Interesting history, well-preserved." },
    { landmark: plaza, rating: 3, comment: "Okay, but not much to *do* besides look." }
  ])
end

if lamlam
   Review.create!([
    { landmark: lamlam, rating: 5, comment: "Tough hike, but the views are incredible. Felt like the top of the world!" },
  ])
end

 if sigua
   Review.create!([
    { landmark: sigua, rating: 4, comment: "The waterfall is beautiful, hike can be muddy." },
  ])
end


puts "Finished seeding #{Review.count} reviews."
