class AddDefaultToClimates < ActiveRecord::Migration
  def change
  	add_column :climates, :default, :boolean
  end
end
