class NotesController < ApplicationController

  def create
    @note = Note.new(note_params)

    @note.save
    redirect_to tracks_url
  end

  def delete

  end

  private

  def note_params
    params.require(:note).permit(:content, :user_id, :track_id)
  end

end
