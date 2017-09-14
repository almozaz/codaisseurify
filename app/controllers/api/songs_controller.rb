class Api::SongsController < ApplicationController

  def create
    song = Song.new(song_params)

    if song.save
      render status: 201, json: {
        message: "Song created",
        song: song
      }.to_json
    else
      render status: 422, json: {
        errors: song.errors
      }.to_json
    end
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy

    render status: 200, json: {
      message: "Song deleted"
    }.to_json
  end

  private

  def song_params
    params
      .require(:song)
      .permit(:name)
  end
end
