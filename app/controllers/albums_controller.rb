class AlbumsController < ApplicationController

  before_action :require_login

  def index
    @albums = Album.all.order(:id)
    render :index
  end

  def new
    @bands = Band.all
    render :new
  end

  def create

    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = ["Incomplete Form"]
      redirect_to new_album_url
    end

  end

  def show
    @album = Album.find(params[:id])
    if @album
      render :show
    else
      redirect_to albums_url
    end
  end

  def edit
    @bands = Band.all
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      redirect_to edit_album_url
    end

  end

  def destroy
    @album = Album.find(params[:id])

    if @album.destroy
      redirect_to albums_url
    else
      redirect_to album_url(@album)
    end
  end


  private

  def album_params
    params.require(:album).permit(:title, :band_id, :recorded)
  end

end
