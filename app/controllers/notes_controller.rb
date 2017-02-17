class NotesController < ApplicationController

  before_action :require_login

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.save
    redirect_to track_url(Track.find(@note.track_id))
  end

  def destroy
    @note = Note.find(params[:id])
    @note.delete
    redirect_to track_url(Track.find(@note.track_id))
  end

  private

  def note_params
    params.require(:note).permit(:content, :user_id, :track_id)
  end

end
