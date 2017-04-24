class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.text :descriptionsComponent
      t.references :case, index: true, foreign_key: true
      t.references :mold, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
