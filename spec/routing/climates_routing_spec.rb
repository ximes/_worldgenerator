require "spec_helper"

describe ClimatesController do
  describe "routing" do

    it "routes to #index" do
      get("/climates").should route_to("climates#index")
    end

    it "routes to #new" do
      get("/climates/new").should route_to("climates#new")
    end

    it "routes to #show" do
      get("/climates/1").should route_to("climates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/climates/1/edit").should route_to("climates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/climates").should route_to("climates#create")
    end

    it "routes to #update" do
      put("/climates/1").should route_to("climates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/climates/1").should route_to("climates#destroy", :id => "1")
    end

  end
end
