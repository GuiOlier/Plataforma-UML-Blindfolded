class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :nameDiagram
      t.integer :elemInitial
      t.integer :elemEnd
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
