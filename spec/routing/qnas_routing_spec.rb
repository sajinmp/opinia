require "rails_helper"

RSpec.describe QnasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/qnas").to route_to("qnas#index")
    end

    it "routes to #new" do
      expect(:get => "/qnas/new").to route_to("qnas#new")
    end

    it "routes to #show" do
      expect(:get => "/qnas/1").to route_to("qnas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/qnas/1/edit").to route_to("qnas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/qnas").to route_to("qnas#create")
    end

    it "routes to #update" do
      expect(:put => "/qnas/1").to route_to("qnas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/qnas/1").to route_to("qnas#destroy", :id => "1")
    end

  end
end
