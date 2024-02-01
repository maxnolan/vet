class CreatePhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :photos do |t|
      t.belongs_to :imageable, polymorphic: true
      t.string :image_url
      t.timestamps
    end
  end
end
