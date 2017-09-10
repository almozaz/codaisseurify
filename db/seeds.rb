Artist.destroy_all

artist1 = Artist.create!( name: Faker::RockBand.name , description: Faker::Hipster.sentence(4) )
artist2 = Artist.create!( name: Faker::RockBand.name , description: Faker::Hipster.sentence(4) )
artist3 = Artist.create!( name: Faker::RockBand.name , description: Faker::Hipster.sentence(4) )

#artist1 songs
5.times do
  Song.create!(
  name: Faker::Cat.breed,
  artist: artist1
  )
end

#artist2 songs
5.times do
  Song.create!(
  name: Faker::Cat.breed,
  artist: artist2
  )
end

#artist3 songs
5.times do
  Song.create!(
  name: Faker::Cat.breed,
  artist: artist3
  )
end

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dzc6qaitk/image/upload/v1504980241/maxresdefault_og3n9u.jpg", artist: artist1 )
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dzc6qaitk/image/upload/v1504980241/artist2_rhjoga.jpg", artist: artist2 )
photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dzc6qaitk/image/upload/v1504980241/singer-career_ycq49m.jpg", artist: artist3 )
