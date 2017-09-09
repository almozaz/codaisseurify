class SongsController < ApplicationController

  def index; end

  def new; end

  def create
    @song = Song.create(song_params.merge(artist_id: params[:artist_id]))
    redirect_to @song.artist, notice: "Song added"
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to request.referrer
  end

  private

  def song_params
    params
      .require(:song)
      .permit(:name)
  end
end
