require 'spec_helper'

describe "zones/index" do
  before(:each) do
    assign(:zones, [
      stub_model(Zone,
        :visited => false,
        :x => "9.99",
        :y => "9.99",
        :z => "9.99"
      ),
      stub_model(Zone,
        :visited => false,
        :x => "9.99",
        :y => "9.99",
        :z => "9.99"
      )
    ])
  end

  it "renders a list of zones" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "tr>td", :text => false.to_s, :count => 2
    # assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
