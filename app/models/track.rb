# == Schema Information
#
# Table name: tracks
#
#  id       :integer          not null, primary key
#  name     :string           not null
#  album_id :integer          not null
#  variety  :string           not null
#  lyrics   :text
#

class Track < ActiveRecord::Base
  validates :name, :album_id, :variety, presence: true

  belongs_to :album
  has_many :notes
  
end
