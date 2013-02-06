require 'spec_helper'

describe CatsController do
  let(:file) { fixture_file_upload('/lion.jpg', 'image/jpg') }

  describe "#create" do

    let(:cat_params) do
      { :cat => {
        :name => "Mimsy", :age => "102", :breed => "Himalayan",
        :picture => file
        }
      }
    end

    it "creates a new cat" do
      expect do
        post :create, cat_params
      end.to change{Cat.count}.by(1)
    end

    it "redirects after successful create" do
      post :create, cat_params
      expect(response).to redirect_to(cats_path)
    end
  end

  describe "#rating" do
    before do
      FactoryGirl.create(:cat)
    end

    let(:rating_params) do
      { rating: {
        rating: 3
        },
        id: 1
      }
    end

    it "creates a rating" do
      expect do
        post :rating, rating_params
      end.to change{Rating.count}.by(1)
    end

    it "redirects to cat index" do
      post :rating, rating_params
      expect(response).to redirect_to(cats_path)
    end
  end
end
