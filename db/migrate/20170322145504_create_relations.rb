class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :elemStart
      t.integer :elemEnd
      t.references :case, index: true, foreign_key: true
      t.references :connection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
