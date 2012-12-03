require 'spec_helper'

describe "zones/new" do
  before(:each) do
    assign(:zone, stub_model(Zone,
      :visited => false,
      :x => "9.99",
      :y => "9.99",
      :z => "9.99",
      :parent_id => 1
    ).as_new_record)
  end

  it "renders new zone form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => zones_path, :method => "post" do
      assert_select "input#zone_visited", :name => "zone[visited]"
      assert_select "input#zone_x", :name => "zone[x]"
      assert_select "input#zone_y", :name => "zone[y]"
      assert_select "input#zone_z", :name => "zone[z]"
      assert_select "input#zone_parent_id", :name => "zone[parent_id]"
    end
  end
end
