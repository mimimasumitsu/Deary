class CreateAlbumUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :album_users do |t|

      t.integer :album_id, null: false
      t.integer :user_id, null:false
      t.timestamps
    end
  end
end
