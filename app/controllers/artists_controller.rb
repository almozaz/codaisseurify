class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show; end

  def new
    @artist = artist.build
  end

  def create
    @artist = artist.build(artist_params)

    if @artist.save
      redirect_to @artist, notice: "Artist created"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @artist.update(artist_params)
      redirect_to @artist, notice: "Artist updated"
    else
      render :edit
    end
  end

  private

  # def set_room
  #   @artist = Artist.find(params[:id])
  # end

  def artist_params
    params
      .require(:artist)
      .permit( :name, :description )
  end
end
