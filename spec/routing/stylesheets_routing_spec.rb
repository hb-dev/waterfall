require "spec_helper"

describe StylesheetsController do
  describe "routing" do

    it "routes to #index" do
      get("/stylesheets").should route_to("stylesheets#index")
    end

    it "routes to #new" do
      get("/stylesheets/new").should route_to("stylesheets#new")
    end

    it "routes to #show" do
      get("/stylesheets/1").should route_to("stylesheets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stylesheets/1/edit").should route_to("stylesheets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stylesheets").should route_to("stylesheets#create")
    end

    it "routes to #update" do
      put("/stylesheets/1").should route_to("stylesheets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stylesheets/1").should route_to("stylesheets#destroy", :id => "1")
    end

  end
end
