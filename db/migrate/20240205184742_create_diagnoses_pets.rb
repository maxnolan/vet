class CreateDiagnosesPets < ActiveRecord::Migration[7.1]
  def change
    create_table :diagnoses_pets, id: false do |t|
      t.references :diagnosis, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
