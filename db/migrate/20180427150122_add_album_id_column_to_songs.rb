class AddAlbumIdColumnToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :album_id, :integer
  end
end
