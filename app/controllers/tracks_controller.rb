class TracksController < ApplicationController

  def index
    @tracks = Track.all.order(:id)
    render :index
  end

  def new
    @albums = Album.all
    render :new
  end

  def create

    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      flash[:errors] = ["Incomplete Form"]
      redirect_to new_track_url
    end

  end

  def show
    @track = Track.find(params[:id])
    if @track
      render :show
    else
      redirect_to tracks_url
    end
  end

  def edit
    @albums = Album.all
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      redirect_to edit_track_url
    end

  end

  def destroy
    @track = Track.find(params[:id])

    if @track.destroy
      redirect_to tracks_url
    else
      redirect_to track_url(@track)
    end
  end


  private

  def track_params
    params.require(:track).permit(:name, :album_id, :variety, :lyrics)
  end

end
