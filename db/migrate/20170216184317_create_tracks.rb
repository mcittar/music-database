class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, null: false
      t.string :variety, null: false
      t.text :lyrics
    end
    add_column :albums, :recorded, :string, null: false
    add_index :tracks, :album_id
  end
end
