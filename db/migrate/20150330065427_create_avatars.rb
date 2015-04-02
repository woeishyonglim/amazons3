class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :user_name
      t.string :pic_name
      t.string :attachment
      t.references :employee, index: true

      t.timestamps null: false
    end
  end
end
