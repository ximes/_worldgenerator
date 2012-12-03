class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.boolean :visited
      t.decimal :x
      t.decimal :y
      t.decimal :z

      t.timestamps
    end
  end
end
