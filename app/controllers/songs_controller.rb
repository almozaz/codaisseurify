class SongsController < ApplicationController
  def create
    @song = Song.create(song_params.merge(artist_id: params[:artist_id]))
    if @song.save
      redirect_to @song.artist, notice: "Song added"
    else
      redirect_to @song.artist
    end
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
