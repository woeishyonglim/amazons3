class DropPicturesTables < ActiveRecord::Migration
  def change
    def up
      drop_table :pictures
    end
  end
end
