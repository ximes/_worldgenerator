require 'spec_helper'

describe "climates/edit" do
  before(:each) do
    @climate = assign(:climate, stub_model(Climate,
      :name => "MyString",
      :probability => "9.99",
      :color => "MyText",
      :radius => "9.99",
      :scale => "9.99",
      :description => "MyText",
      :interacts => false,
      :overlaps => false,
      :x => "9.99",
      :y => "9.99",
      :z => "9.99"
    ))
  end

  it "renders the edit climate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => climates_path(@climate), :method => "post" do
      assert_select "input#climate_name", :name => "climate[name]"
      assert_select "input#climate_probability", :name => "climate[probability]"
      assert_select "textarea#climate_color", :name => "climate[color]"
      assert_select "input#climate_radius", :name => "climate[radius]"
      assert_select "input#climate_scale", :name => "climate[scale]"
      assert_select "textarea#climate_description", :name => "climate[description]"
      assert_select "input#climate_interacts", :name => "climate[interacts]"
      assert_select "input#climate_overlaps", :name => "climate[overlaps]"
      assert_select "input#climate_x", :name => "climate[x]"
      assert_select "input#climate_y", :name => "climate[y]"
      assert_select "input#climate_z", :name => "climate[z]"
    end
  end
end
