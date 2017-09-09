require 'rails_helper'

RSpec.describe Artist, type: :model do
  artist = Artist.create!( name: Faker::Lovecraft.deity , description: Faker::Lovecraft.fhtagn(3) )

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "association with songs" do
    song1 = Song.create!(name: Faker::Lovecraft.tome, artist: artist )
    song2 = Song.create!(name: Faker::Lovecraft.tome, artist: artist )

    it "has many songs" do
      expect(artist.songs).to include(song1)
      expect(artist.songs).to include(song2)
    end

    it "deletes associated events" do
    expect { artist.destroy }.to change(artist.songs, :count).by(-2)
    end
  end
end
