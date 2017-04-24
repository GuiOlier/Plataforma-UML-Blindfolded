class CreateTransitions < ActiveRecord::Migration
  def change
    create_table :transitions do |t|
      t.integer :elemStart
      t.integer :elemEnd
      t.text :descriptionTran
      t.references :machine, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
