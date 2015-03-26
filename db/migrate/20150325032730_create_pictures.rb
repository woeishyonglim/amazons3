class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :user_name
      t.string :pic_name
      t.string :attachment
      t.timestamps null: false
    end
  end
end
