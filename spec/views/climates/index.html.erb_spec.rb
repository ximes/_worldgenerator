require 'spec_helper'

describe "climates/index" do
  before(:each) do
    assign(:climates, [
      stub_model(Climate,
        :name => "Name",
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
      ),
      stub_model(Climate,
        :name => "Name",
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
      )
    ])
  end

  it "renders a list of climates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "tr>td", :text => "Name".to_s, :count => 2
    # assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # assert_select "tr>td", :text => false.to_s, :count => 2
    # assert_select "tr>td", :text => false.to_s, :count => 2
    # assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
