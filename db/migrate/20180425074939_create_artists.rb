class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|

      t.string :singer
      t.string :description

      t.timestamps
    end
    add_index :artists, :singer
    add_index :artists, :description
  end
end
