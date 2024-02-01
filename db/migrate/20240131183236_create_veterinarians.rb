class CreateVeterinarians < ActiveRecord::Migration[7.1]
  def change
    create_table :veterinarians do |t|
      t.string :name
      t.string :license
      t.timestamps
    end
  end
end
