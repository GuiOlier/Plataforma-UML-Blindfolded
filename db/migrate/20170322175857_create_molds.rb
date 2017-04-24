class CreateMolds < ActiveRecord::Migration
  def change
    create_table :molds do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
