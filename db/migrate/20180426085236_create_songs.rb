class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.text :text
      t.references :artist, foreign_key: true   #создает числовой столбец с именем artist_id, индекс для него,
                                                # и ограничение внешнего ключа, указывающего на столбец id таблицы artist
      t.timestamps
    end
  end
end
