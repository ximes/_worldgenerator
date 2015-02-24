class Climate < ActiveRecord::Base
  attr_accessible :color, :description, :interacts, :name, :overlaps, :probability, :radius, :scale, :x, :y, :z, :default
end
