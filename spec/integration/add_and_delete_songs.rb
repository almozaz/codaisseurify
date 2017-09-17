require 'rails_helper'

feature 'All features', js: true do
  let!(:artist1)       { create :artist, name: "Artist 1" }

  let!(:song1) { create :song, name: "Song 1", artist: artist1}
  let!(:song2) { create :song, name: "Song 2", artist: artist1}

  scenario 'add a new song' do

    visit artists_path

    click_link "Artist 1"

    fill_in 'song_name', with: 'New song'

    page.execute_script("$('form').submit()")

    expect(page).to have_content('New song')
  end

  scenario 'delete all songs' do

    visit artist_path(artist1)

    click_link "Delete all songs"

    songList = find('#song-list').all('tr')

    expect(songList.size).to eq(0)
  end

  scenario 'one song' do
# 
#     visit artist_path(artist1)
# sleep(1)
#     click_link (".delete-song")
# sleep(1)
#     expect(songList.size).to eq(1)
  end
end
