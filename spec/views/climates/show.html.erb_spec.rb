require 'spec_helper'

describe "climates/show" do
  before(:each) do
    @climate = assign(:climate, stub_model(Climate,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/9.99/)
    rendered.should match(/MyText/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
