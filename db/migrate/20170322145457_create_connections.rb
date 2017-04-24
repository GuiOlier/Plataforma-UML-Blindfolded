class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
