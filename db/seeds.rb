artist1 = Artist.create!( name: Faker::Lovecraft.deity , description: Faker::Lovecraft.fhtagn(3) )
artist2 = Artist.create!( name: Faker::Lovecraft.deity , description: Faker::Lovecraft.fhtagn(3) )
artist3 = Artist.create!( name: Faker::Lovecraft.deity , description: Faker::Lovecraft.fhtagn(3) )

5.times do
  Song.create!(
  name: Faker::Lovecraft.tome,
  artist: artist1
  )
end

5.times do
  Song.create!(
  name: Faker::Lovecraft.tome,
  artist: artist2
  )
end

5.times do
  Song.create!(
  name: Faker::Lovecraft.tome,
  artist: artist3
  )
end
