require 'spec_helper'

describe "zones/show" do
  before(:each) do
    @zone = assign(:zone, stub_model(Zone,
      :visited => false,
      :x => "9.99",
      :y => "9.99",
      :z => "9.99",
      :parent_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
  end
end
