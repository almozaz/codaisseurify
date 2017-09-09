require 'rails_helper'

RSpec.describe Song, type: :model do
  artist  = Artist.create!( name: Faker::Lovecraft.deity , description: Faker::Lovecraft.fhtagn(3) )
  song1   = Song.create!(name: Faker::Lovecraft.tome, artist: artist )
  
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "association with artist"do
    it { is_expected.to belong_to :artist}
  end
end
