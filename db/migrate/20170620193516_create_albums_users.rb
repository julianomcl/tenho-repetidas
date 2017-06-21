class CreateAlbumsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :albums_users do |t|
      t.references :album
      t.references :user
    end
  end
end
