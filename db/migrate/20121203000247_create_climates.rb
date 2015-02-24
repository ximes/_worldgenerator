class CreateClimates < ActiveRecord::Migration
  def change
    create_table :climates do |t|
      t.string :name
      t.decimal :probability
      t.text :color
      t.decimal :radius
      t.decimal :scale
      t.text :description
      t.boolean :interacts
      t.boolean :overlaps
      t.decimal :x
      t.decimal :y
      t.decimal :z

      t.timestamps
    end
  end
end
