class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :namediagram
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
