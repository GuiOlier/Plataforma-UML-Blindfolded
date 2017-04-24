class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :nameElem
      t.text :descriptionElem
      t.references :machine, index: true, foreign_key: true
      t.references :type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
