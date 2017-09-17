class SongsController < ApplicationController
  
  def create
    # @artist = Artist.find(params[:artist_id])
    # @song = Song.create(song_params)
    # respond_to do |format|
    #   if @song.save
    #     format.html { redirect_to artist_path(@artist), notice: "Song added" }
    #     format.json { render :show, status: :created, location: @song }
    #   else
    #     format.html { redirect_to artist_path(@artist) }
    #     format.json { render json: @song.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.json { head :no_content }
    end
  end

  private

  def song_params
    params
      .require(:song)
      .permit(:name)
  end
end
