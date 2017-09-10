artist1 = Artist.create!( name: Faker::Lovecraft.deity , description: Faker::Lovecraft.fhtagn(3) )
artist2 = Artist.create!( name: Faker::Lovecraft.deity , description: Faker::Lovecraft.fhtagn(3) )
artist3 = Artist.create!( name: Faker::Lovecraft.deity , description: Faker::Lovecraft.fhtagn(3) )

#artist1 songs
5.times do
  Song.create!(
  name: Faker::Lovecraft.tome,
  artist: artist1
  )
end

#artist2 songs
5.times do
  Song.create!(
  name: Faker::Lovecraft.tome,
  artist: artist2
  )
end

#artist3 songs
5.times do
  Song.create!(
  name: Faker::Lovecraft.tome,
  artist: artist3
  )
end

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dzc6qaitk/image/upload/v1504980241/maxresdefault_og3n9u.jpg", artist: artist1)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dzc6qaitk/image/upload/v1504980241/artist2_rhjoga.jpg", artist: artist2)
photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dzc6qaitk/image/upload/v1504980241/singer-career_ycq49m.jpg", artist: artist3)
