class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :editor
      t.integer :total
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
