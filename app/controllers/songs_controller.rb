class SongsController < ApplicationController

  def index; end

  def new; end

  def create
    @song = Song.new(song_params.merge(artist_id: params[:artist_id]))
    @song.save
    redirect_to @song.artist, notice: "Song added"
  end

  def; end

  private

  def song_params
    params
      .require(:song)
      .permit(:name)
  end
end
